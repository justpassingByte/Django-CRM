import axios from 'axios';
import { redirect, fail } from '@sveltejs/kit';
import { env } from '$env/dynamic/private';
import { env as publicEnv } from '$env/dynamic/public';
import { generateCodeVerifier, generateCodeChallenge, generateState } from '$lib/utils/pkce.js';
import { describeError } from '$lib/server/log-safe.js';

const GOOGLE_AUTH_URL = 'https://accounts.google.com/o/oauth2/v2/auth';
const GOOGLE_SCOPES = ['openid', 'email', 'profile'].join(' ');

const COOKIE_OPTIONS = {
  path: '/',
  httpOnly: true,
  sameSite: 'lax'
};

function getCookieOptions(maxAge) {
  return {
    ...COOKIE_OPTIONS,
    secure: env.NODE_ENV === 'production',
    maxAge
  };
}

/** @type {import('@sveltejs/kit').ServerLoad} */
export async function load({ url, cookies }) {
  const code = url.searchParams.get('code');
  const returnedState = url.searchParams.get('state');
  const error = url.searchParams.get('error');
  const errorDescription = url.searchParams.get('error_description');

  if (error) {
    return {
      google_url: null,
      error: errorDescription || `OAuth error: ${error}`
    };
  }

  if (code) {
    return handleOAuthCallback(code, returnedState, cookies);
  }

  const jwtAccess = cookies.get('jwt_access');
  if (jwtAccess) {
    throw redirect(307, '/org');
  }

  return await generateOAuthUrl(cookies);
}

async function handleOAuthCallback(code, returnedState, cookies) {
  const codeVerifier = cookies.get('oauth_code_verifier');
  const savedState = cookies.get('oauth_state');

  cookies.delete('oauth_code_verifier', { path: '/' });
  cookies.delete('oauth_state', { path: '/' });

  if (!codeVerifier || !savedState || savedState !== returnedState) {
    throw redirect(307, '/login?error=invalid_state');
  }

  try {
    const apiUrl = publicEnv.PUBLIC_DJANGO_API_URL;
    const redirect_uri = env.GOOGLE_LOGIN_DOMAIN + '/login';

    const response = await axios.post(
      `${apiUrl}/api/auth/google/callback/`,
      { code, code_verifier: codeVerifier, redirect_uri },
      { headers: { 'Content-Type': 'application/json' }, timeout: 10000 }
    );

    const { access_token, refresh_token } = response.data;

    cookies.set('jwt_access', access_token, getCookieOptions(60 * 60 * 24));
    cookies.set('jwt_refresh', refresh_token, getCookieOptions(60 * 60 * 24 * 365));
  } catch (error) {
    console.error('OAuth token exchange failed:', describeError(error));
    throw redirect(307, '/login?error=auth_failed');
  }

  throw redirect(307, '/org');
}

async function generateOAuthUrl(cookies) {
  if (!env.GOOGLE_CLIENT_ID) {
    return { google_url: null };
  }
  const codeVerifier = generateCodeVerifier();
  const codeChallenge = await generateCodeChallenge(codeVerifier);
  const state = generateState();
  const oauthCookieMaxAge = 60 * 10;

  cookies.set('oauth_code_verifier', codeVerifier, getCookieOptions(oauthCookieMaxAge));
  cookies.set('oauth_state', state, getCookieOptions(oauthCookieMaxAge));

  const redirect_uri = env.GOOGLE_LOGIN_DOMAIN + '/login';
  const params = new URLSearchParams({
    client_id: env.GOOGLE_CLIENT_ID,
    redirect_uri,
    response_type: 'code',
    scope: GOOGLE_SCOPES,
    state,
    code_challenge: codeChallenge,
    code_challenge_method: 'S256',
    access_type: 'offline',
    prompt: 'consent'
  });

  return { google_url: `${GOOGLE_AUTH_URL}?${params.toString()}` };
}

/** @type {import('@sveltejs/kit').Actions} */
export const actions = {
  // Password Login (Standard)
  password: async ({ request, cookies }) => {
    const formData = await request.formData();
    const email = formData.get('email')?.toString().trim();
    const password = formData.get('password')?.toString();

    if (!email || !password) {
      return fail(400, { error: 'Vui lòng nhập đầy đủ Email và Mật khẩu!' });
    }

    try {
      const apiUrl = publicEnv.PUBLIC_DJANGO_API_URL || 'http://backend:8000';
      const response = await axios.post(
        `${apiUrl}/api/auth/login/`,
        { email, password },
        { headers: { 'Content-Type': 'application/json' }, timeout: 10000 }
      );

      const { access_token, refresh_token } = response.data;

      const secure = env.NODE_ENV === 'production';
      cookies.set('jwt_access', access_token, {
        path: '/',
        httpOnly: true,
        sameSite: 'lax',
        secure,
        maxAge: 60 * 60 * 24 // 1 day
      });
      cookies.set('jwt_refresh', refresh_token, {
        path: '/',
        httpOnly: true,
        sameSite: 'lax',
        secure,
        maxAge: 60 * 60 * 24 * 365 // 1 year
      });
    } catch (error) {
      const msg = error.response?.data?.error || 'Email hoặc Mật khẩu không chính xác!';
      return fail(401, { error: msg });
    }

    throw redirect(303, '/org');
  },

  // Magic Link
  magicLink: async ({ request }) => {
    const formData = await request.formData();
    const email = formData.get('email');

    if (!email) {
      return fail(400, { error: 'Vui lòng nhập địa chỉ Email!' });
    }

    try {
      const apiUrl = publicEnv.PUBLIC_DJANGO_API_URL || 'http://backend:8000';
      await axios.post(
        `${apiUrl}/api/auth/magic-link/request/`,
        { email },
        { headers: { 'Content-Type': 'application/json' }, timeout: 10000 }
      );
      return { success: true, magicLinkSent: true };
    } catch {
      return { success: true, magicLinkSent: true };
    }
  }
};
