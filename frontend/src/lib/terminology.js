/**
 * Label lookup for vertical packs with Vietnamese Localization Defaults.
 */

const VIETNAMESE_FALLBACKS = {
  'lead.singular': 'Khách tiềm năng',
  'lead.plural': 'Khách tiềm năng (Leads)',
  'opportunity.singular': 'Cơ hội kinh doanh',
  'opportunity.plural': 'Cơ hội kinh doanh (Deals)',
  'account.singular': 'Doanh nghiệp / Khách hàng',
  'account.plural': 'Khách hàng doanh nghiệp (Accounts)',
  'contact.singular': 'Người liên hệ',
  'contact.plural': 'Danh bạ liên hệ (Contacts)',
  'case.singular': 'Yêu cầu hỗ trợ',
  'case.plural': 'Yêu cầu hỗ trợ (Tickets)',
  'task.singular': 'Nhiệm vụ',
  'task.plural': 'Công việc & Nhiệm vụ',
  'invoice.singular': 'Hóa đơn',
  'invoice.plural': 'Hóa đơn & Báo giá'
};

export function t(terminology, key, fallback) {
  const value = terminology?.[key];
  if (typeof value === 'string' && value.length > 0) {
    return value;
  }
  return VIETNAMESE_FALLBACKS[key] || fallback;
}
