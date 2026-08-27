<script>
  import { resolve } from '$app/paths';
  import '../../../app.css';
  import '$lib/v2/styles/v2.css';
  import { enhance } from '$app/forms';

  import imgGoogle from '$lib/assets/images/google.svg';
  import imgLogo from '$lib/assets/images/logo.png';
  import { Mail, Lock, LogIn, Check, ShieldAlert } from '@lucide/svelte';

  let { data = {}, form = null } = $props();

  let isSubmitting = $state(false);
  let email = $state('admin@smecrm.vn');
  let password = $state('testpass123');
  let useMagicLink = $state(false);
  let magicLinkSent = $state(false);

  function handleLoginSubmit() {
    isSubmitting = true;
    return async ({ update }) => {
      isSubmitting = false;
      await update();
    };
  }
</script>

<svelte:head>
  <title>Đăng Nhập · SME CRM Pro (COSS Vietnam)</title>
  <meta
    name="description"
    content="Đăng nhập hệ thống quản lý quan hệ khách hàng và báo giá SME CRM Pro."
  />
</svelte:head>

<div class="v2-root v2-auth" style="min-height: 100vh; display: flex; align-items: center; justify-content: center; background: #0b0f19; padding: 1.5rem;">
  <div class="v2-auth-box" style="width: 100%; max-width: 440px;">
    
    <!-- Logo & Brand Header -->
    <div style="display: flex; align-items: center; justify-content: center; gap: 10px; margin-bottom: 1.75rem;">
      <div style="width: 42px; height: 42px; border-radius: 12px; background: linear-gradient(135deg, #2563eb, #7c3aed); display: flex; align-items: center; justify-content: center; color: white; font-weight: 900; font-size: 1.15rem; box-shadow: 0 4px 14px rgba(37,99,235,0.4);">
        CRM
      </div>
      <div>
        <div style="font-size: 1.35rem; font-weight: 800; color: #fff; line-height: 1.1;">
          SME CRM <span style="background: linear-gradient(135deg, #3b82f6, #8b5cf6); padding: 2px 7px; border-radius: 6px; font-size: 0.75rem;">PRO</span>
        </div>
        <div style="font-size: 0.75rem; color: #94a3b8; margin-top: 2px;">
          COSS Vietnam · Quản Trị Khách Hàng B2B
        </div>
      </div>
    </div>

    <!-- Auth Card -->
    <div class="v2-auth-card" style="background: #131b2e; border: 1px solid rgba(255,255,255,0.1); border-radius: 16px; padding: 2rem; box-shadow: 0 20px 40px rgba(0,0,0,0.5);">
      
      <div style="margin-bottom: 1.5rem;">
        <h1 style="font-size: 1.35rem; font-weight: 800; color: #fff; margin-bottom: 0.35rem;">
          Đăng Nhập Hệ Thống
        </h1>
        <p style="font-size: 0.85rem; color: #94a3b8;">
          Nhập tài khoản quản trị để truy cập dữ liệu kinh doanh.
        </p>
      </div>

      {#if form?.error}
        <div style="background: rgba(239, 68, 68, 0.15); border: 1px solid #ef4444; color: #f87171; padding: 0.75rem 1rem; border-radius: 8px; font-size: 0.85rem; margin-bottom: 1.25rem; display: flex; align-items: center; gap: 8px;">
          <ShieldAlert size={18} />
          <span>{form.error}</span>
        </div>
      {/if}

      <!-- DIRECT PASSWORD LOGIN FORM -->
      {#if !useMagicLink}
        <form
          method="POST"
          action="?/password"
          use:enhance={handleLoginSubmit}
          style="display: flex; flex-direction: column; gap: 1rem;"
        >
          <div>
            <label for="email" style="display: block; font-size: 0.85rem; font-weight: 600; color: #cbd5e1; margin-bottom: 0.35rem;">
              Địa chỉ Email
            </label>
            <input
              id="email"
              type="email"
              name="email"
              class="v2-input"
              style="width: 100%; background: #1a233a; border: 1px solid rgba(255,255,255,0.15); border-radius: 8px; padding: 0.65rem 0.9rem; color: #fff; font-size: 0.9rem;"
              placeholder="admin@smecrm.vn"
              required
              bind:value={email}
              disabled={isSubmitting}
            />
          </div>

          <div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.35rem;">
              <label for="password" style="font-size: 0.85rem; font-weight: 600; color: #cbd5e1;">
                Mật khẩu
              </label>
            </div>
            <input
              id="password"
              type="password"
              name="password"
              class="v2-input"
              style="width: 100%; background: #1a233a; border: 1px solid rgba(255,255,255,0.15); border-radius: 8px; padding: 0.65rem 0.9rem; color: #fff; font-size: 0.9rem;"
              placeholder="••••••••"
              required
              bind:value={password}
              disabled={isSubmitting}
            />
          </div>

          <button
            type="submit"
            style="width: 100%; background: #2563eb; color: #fff; font-weight: 700; padding: 0.75rem; border-radius: 8px; border: none; font-size: 0.95rem; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px; margin-top: 0.5rem; transition: background 0.2s;"
            disabled={isSubmitting}
          >
            {#if isSubmitting}
              <span class="v2-spin"></span>
              <span>Đang xác thực...</span>
            {:else}
              <LogIn size={18} />
              <span>Đăng Nhập Ngay</span>
            {/if}
          </button>
        </form>
      {:else}
        <!-- MAGIC LINK EMAIL FORM -->
        {#if form?.magicLinkSent || magicLinkSent}
          <div style="background: rgba(16, 185, 129, 0.15); border: 1px solid #10b981; color: #34d399; padding: 1rem; border-radius: 8px; text-align: center;">
            <Check size={28} style="margin: 0 auto 0.5rem; color: #10b981;" />
            <div style="font-weight: 700;">Đã gửi link đăng nhập!</div>
            <div style="font-size: 0.8rem; color: #cbd5e1; margin-top: 4px;">
              Vui lòng kiểm tra hộp thư hoặc log của Docker để nhận link xác thực.
            </div>
          </div>
        {:else}
          <form
            method="POST"
            action="?/magicLink"
            use:enhance={handleLoginSubmit}
            style="display: flex; flex-direction: column; gap: 1rem;"
          >
            <div>
              <label for="email" style="display: block; font-size: 0.85rem; font-weight: 600; color: #cbd5e1; margin-bottom: 0.35rem;">
                Email nhận Magic Link
              </label>
              <input
                id="email"
                type="email"
                name="email"
                class="v2-input"
                style="width: 100%; background: #1a233a; border: 1px solid rgba(255,255,255,0.15); border-radius: 8px; padding: 0.65rem 0.9rem; color: #fff; font-size: 0.9rem;"
                placeholder="admin@smecrm.vn"
                required
                bind:value={email}
                disabled={isSubmitting}
              />
            </div>

            <button
              type="submit"
              style="width: 100%; background: #2563eb; color: #fff; font-weight: 700; padding: 0.75rem; border-radius: 8px; border: none; font-size: 0.95rem; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px;"
              disabled={isSubmitting}
            >
              <Mail size={18} />
              <span>Gửi Link Đăng Nhập Qua Email</span>
            </button>
          </form>
        {/if}
      {/if}

      <!-- Alternative Logins -->
      <div style="margin-top: 1.5rem; text-align: center; border-top: 1px solid rgba(255,255,255,0.08); padding-top: 1rem;">
        {#if data['google_url']}
          <a
            href={data['google_url']}
            rel="external"
            style="width: 100%; background: #1a233a; border: 1px solid rgba(255,255,255,0.15); color: #fff; padding: 0.6rem; border-radius: 8px; text-decoration: none; font-size: 0.85rem; font-weight: 600; display: flex; align-items: center; justify-content: center; gap: 8px; margin-bottom: 0.75rem;"
          >
            <img src={imgGoogle} alt="" style="width: 18px; height: 18px;" />
            <span>Đăng nhập với Google Workspace</span>
          </a>
        {/if}

        <button
          type="button"
          onclick={() => { useMagicLink = !useMagicLink; }}
          style="background: none; border: none; color: #3b82f6; font-size: 0.8rem; cursor: pointer; font-weight: 600;"
        >
          {useMagicLink ? '← Quay lại đăng nhập bằng Mật khẩu' : 'Hoặc đăng nhập không cần mật khẩu (Magic Link) →'}
        </button>
      </div>

    </div>

    <!-- Quick Credentials Hint -->
    <div style="margin-top: 1.25rem; background: rgba(37,99,235,0.08); border: 1px dashed rgba(59,130,246,0.3); border-radius: 10px; padding: 0.75rem 1rem; text-align: center; font-size: 0.8rem; color: #94a3b8;">
      <div>🔑 <b>Tài khoản mặc định:</b> <code style="color:#60a5fa">admin@smecrm.vn</code></div>
      <div>🔒 <b>Mật khẩu mặc định:</b> <code style="color:#60a5fa">testpass123</code></div>
    </div>

  </div>
</div>
