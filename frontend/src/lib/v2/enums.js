/**
 * v2 enums — Vietnamese SME Business Localization
 */

export const STAGES = [
  'PROSPECTING',
  'QUALIFICATION',
  'PROPOSAL',
  'NEGOTIATION',
  'CLOSED_WON',
  'CLOSED_LOST'
];

export const OPEN_STAGES = STAGES.slice(0, 4);

export const STAGE_LABEL = {
  PROSPECTING: 'Khảo sát nhu cầu',
  QUALIFICATION: 'Xác định tiềm năng',
  PROPOSAL: 'Gửi báo giá',
  NEGOTIATION: 'Thương thảo hợp đồng',
  CLOSED_WON: 'Chốt đơn thành công',
  CLOSED_LOST: 'Thất bại'
};

export const STAGE_TONE = {
  PROSPECTING: 'slate',
  QUALIFICATION: 'slate',
  PROPOSAL: 'ink',
  NEGOTIATION: 'ink',
  CLOSED_WON: 'moss',
  CLOSED_LOST: 'rust'
};

export const OPPORTUNITY_TYPE_LABEL = {
  NEW_BUSINESS: 'Hợp đồng mới',
  EXISTING_BUSINESS: 'Khách hàng hiện tại',
  RENEWAL: 'Tái ký hợp đồng',
  UPSELL: 'Bán thêm (Upsell)',
  CROSS_SELL: 'Bán chéo (Cross-sell)'
};

export const AGING_TONE = { green: 'slate', yellow: 'clay', red: 'rust' };
export const AGING_LABEL = { green: 'Đúng tiến độ', yellow: 'Quá hạn dự kiến', red: 'Chậm trễ / Tắc nghẽn' };

export const LEAD_STATUS_TONE = {
  assigned: 'slate',
  'in process': 'ink',
  converted: 'moss',
  recycled: 'slate',
  closed: 'rust'
};

export const LEAD_STATUSES = ['assigned', 'in process', 'converted', 'recycled', 'closed'];

export const LEAD_STATUS_LABEL = {
  assigned: 'Đã phân công',
  'in process': 'Đang tư vấn',
  converted: 'Đã chuyển đổi',
  recycled: 'Liên hệ lại sau',
  closed: 'Đã đóng'
};

export const LEAD_LIST_STATUSES = ['assigned', 'in process', 'recycled'];

export const LEAD_SOURCES = [
  'call',
  'email',
  'existing customer',
  'partner',
  'public relations',
  'compaign',
  'other'
];

export const LEAD_SOURCE_LABEL = {
  call: 'Gọi điện thoại',
  email: 'Email liên hệ',
  'existing customer': 'Khách hàng cũ',
  partner: 'Đối tác giới thiệu',
  'public relations': 'Truyền thông / PR',
  compaign: 'Chiến dịch Marketing',
  other: 'Nguồn khác'
};

export const LEAD_IRREVERSIBLE_STATUSES = ['converted'];

export const INDUSTRIES = [
  'ADVERTISING',
  'AGRICULTURE',
  'APPAREL & ACCESSORIES',
  'AUTOMOTIVE',
  'BANKING',
  'BIOTECHNOLOGY',
  'BUILDING MATERIALS & EQUIPMENT',
  'CHEMICAL',
  'COMPUTER',
  'EDUCATION',
  'ELECTRONICS',
  'ENERGY',
  'ENTERTAINMENT & LEISURE',
  'FINANCE',
  'FOOD & BEVERAGE',
  'GROCERY',
  'HEALTHCARE',
  'INSURANCE',
  'LEGAL',
  'MANUFACTURING',
  'PUBLISHING',
  'REAL ESTATE',
  'SERVICE',
  'SOFTWARE',
  'SPORTS',
  'TECHNOLOGY',
  'TELECOMMUNICATIONS',
  'TELEVISION',
  'TRANSPORTATION',
  'VENTURE CAPITAL'
];

export const industryLabel = (v) => (!v ? '' : v.charAt(0) + v.slice(1).toLowerCase());

export const PRIORITY_TONE = { Urgent: 'rust', High: 'clay', Normal: 'slate', Low: 'slate' };

export const CASE_STATUS_TONE = {
  New: 'ink',
  Assigned: 'ink',
  Pending: 'clay',
  Closed: 'moss',
  Rejected: 'rust',
  Duplicate: 'slate'
};

export const INVOICE_STATUS_TONE = {
  Draft: 'slate',
  Sent: 'ink',
  Viewed: 'ink',
  Paid: 'moss',
  Partially_Paid: 'clay',
  Overdue: 'rust',
  Pending: 'clay',
  Cancelled: 'slate'
};

export const invoiceStatusLabel = (s) => {
  const map = {
    Draft: 'Bản nháp',
    Sent: 'Đã gửi khách',
    Viewed: 'Khách đã xem',
    Paid: 'Đã thanh toán',
    Partially_Paid: 'Thanh toán một phần',
    Overdue: 'Quá hạn thanh toán',
    Pending: 'Chờ thanh toán',
    Cancelled: 'Đã hủy'
  };
  return map[s] || String(s ?? '').replace(/_/g, ' ');
};

export const TASK_STATUS = ['New', 'In Progress', 'Completed'];
export const TASK_STATUS_TONE = { New: 'slate', 'In Progress': 'ink', Completed: 'moss' };

export const TASK_PRIORITY = ['Low', 'Medium', 'High'];
export const TASK_PRIORITY_TONE = { Low: 'slate', Medium: 'slate', High: 'clay' };

export const SOLUTION_STATUS = ['draft', 'reviewed', 'approved'];
export const SOLUTION_STATUS_LABEL = { draft: 'Bản nháp', reviewed: 'Đã duyệt sơ bộ', approved: 'Đã phê duyệt' };
export const SOLUTION_STATUS_TONE = { draft: 'slate', reviewed: 'clay', approved: 'moss' };

export const GOAL_TYPE_LABEL = {
  REVENUE: 'Doanh thu (VNĐ)',
  DEALS_CLOSED: 'Số hợp đồng chốt',
  ACTIVITIES: 'Số hoạt động kinh doanh'
};

export const DEAL_TYPE_LABEL = {
  NEW_BUSINESS: 'Hợp đồng mới',
  EXISTING_BUSINESS: 'Khách hàng hiện tại',
  RENEWAL: 'Tái ký hợp đồng',
  UPSELL: 'Bán thêm gói',
  CROSS_SELL: 'Bán chéo sản phẩm'
};

export const PERIOD_TYPE_LABEL = {
  MONTHLY: 'Hàng tháng',
  QUARTERLY: 'Hàng quý',
  YEARLY: 'Hàng năm',
  CUSTOM: 'Tùy chỉnh'
};

export const GOAL_STATUS_LABEL = {
  completed: 'Đạt mục tiêu',
  on_track: 'Đúng tiến độ',
  at_risk: 'Có nguy cơ trễ',
  behind: 'Chậm tiến độ'
};

export const GOAL_STATUS_TONE = {
  completed: 'moss',
  on_track: 'slate',
  at_risk: 'clay',
  behind: 'rust'
};

export const APPROVAL_STATE_LABEL = {
  pending: 'Chờ phê duyệt',
  approved: 'Đã phê duyệt',
  rejected: 'Đã từ chối',
  cancelled: 'Đã rút yêu cầu'
};

export const APPROVAL_STATE_TONE = {
  pending: 'clay',
  approved: 'moss',
  rejected: 'rust',
  cancelled: 'slate'
};

export const ESTIMATE_STATUS_TONE = {
  Draft: 'slate',
  Sent: 'ink',
  Viewed: 'ink',
  Accepted: 'moss',
  Declined: 'rust',
  Expired: 'clay'
};

export const RECURRING_FREQUENCY_LABEL = {
  WEEKLY: 'Hàng tuần',
  BIWEEKLY: '2 tuần một lần',
  MONTHLY: 'Hàng tháng',
  QUARTERLY: 'Hàng quý (3 tháng)',
  SEMI_ANNUALLY: '6 tháng một lần',
  YEARLY: 'Hàng năm',
  CUSTOM: 'Tùy chỉnh'
};

export const PAYMENT_TERMS_LABEL = {
  DUE_ON_RECEIPT: 'Thanh toán khi nhận hàng',
  NET_15: 'Kỳ hạn 15 ngày',
  NET_30: 'Kỳ hạn 30 ngày',
  NET_45: 'Kỳ hạn 45 ngày',
  NET_60: 'Kỳ hạn 60 ngày',
  CUSTOM: 'Tùy chỉnh'
};

export const ROLE_LABEL = { ADMIN: 'Quản trị viên', USER: 'Nhân viên' };
export const ROLE_TONE = { ADMIN: 'clay', USER: 'slate' };

export const ROUTING_STRATEGY_LABEL = {
  direct: 'Luôn gán cho',
  round_robin: 'Chia đều vòng tròn giữa',
  least_busy: 'Gán cho người ít việc nhất trong',
  by_team: 'Bất kỳ ai trong nhóm'
};

export const ROUTING_STRATEGY_NAME = {
  direct: 'Gán trực tiếp',
  round_robin: 'Chia đều vòng tròn (Round-robin)',
  least_busy: 'Người ít việc nhất',
  by_team: 'Theo đội ngũ'
};

export const CONDITION_FIELD_LABEL = {
  priority: 'Độ ưu tiên',
  case_type: 'Phân loại',
  account: 'Doanh nghiệp',
  tags: 'Thẻ tag',
  from_email_domain: 'Tên miền người gửi',
  mailbox_id: 'Hòm thư'
};

export const CONDITION_OP_LABEL = {
  eq: 'là',
  in: 'thuộc một trong các',
  contains: 'chứa',
  regex: 'khớp biểu thức'
};

export const ESCALATION_ACTION_LABEL = {
  notify: 'Thông báo',
  reassign: 'Chuyển giao cho',
  notify_and_reassign: 'Thông báo & Chuyển giao cho'
};

export const ESCALATION_PRIORITIES = ['Urgent', 'High', 'Normal', 'Low'];

export const DEFAULT_SLA_HOURS = {
  Urgent: { first_response: 1, resolution: 4 },
  High: { first_response: 4, resolution: 24 },
  Normal: { first_response: 8, resolution: 48 },
  Low: { first_response: 24, resolution: 72 }
};

export const MAILBOX_PROVIDER_LABEL = {
  ses: 'Amazon SES',
  mailgun: 'Mailgun',
  postmark: 'Postmark',
  imap: 'IMAP'
};

export const FIELD_TYPE_LABEL = {
  text: 'Văn bản ngắn',
  textarea: 'Đoạn văn bản',
  number: 'Số',
  dropdown: 'Danh sách chọn',
  date: 'Ngày tháng',
  checkbox: 'Hộp kiểm'
};

export const REOPEN_TO_STATUSES = ['New', 'Assigned', 'Pending'];

export const TARGET_MODEL_LABEL = {
  Account: 'Doanh nghiệp',
  Case: 'Ticket hỗ trợ',
  Contact: 'Người liên hệ',
  Estimate: 'Báo giá',
  Invoice: 'Hóa đơn',
  Lead: 'Khách tiềm năng',
  Opportunity: 'Cơ hội kinh doanh',
  RecurringInvoice: 'Hóa đơn định kỳ',
  Task: 'Công việc'
};

export const MACRO_SCOPE_LABEL = { org: 'Toàn công ty', personal: 'Chỉ riêng tôi' };

export const BOARD_PRIORITY_LABEL = {
  low: 'Thấp',
  medium: 'Trung bình',
  high: 'Cao',
  urgent: 'Khẩn cấp'
};
export const BOARD_PRIORITY_TONE = {
  low: 'slate',
  medium: 'slate',
  high: 'clay',
  urgent: 'rust'
};

export const BOARD_ROLE_LABEL = { owner: 'Chủ sở hữu', admin: 'Quản trị viên', member: 'Thành viên' };

export const CASE_PRIORITIES = ['Low', 'Normal', 'High', 'Urgent'];
export const CASE_TYPES = ['Question', 'Incident', 'Problem'];
export const CASE_STATUSES = ['New', 'Assigned', 'Pending', 'Closed', 'Rejected', 'Duplicate'];
export const INVOICE_STATUSES = [
  'Draft',
  'Sent',
  'Viewed',
  'Paid',
  'Partially_Paid',
  'Overdue',
  'Pending',
  'Cancelled'
];
export const ESTIMATE_STATUSES = ['Draft', 'Sent', 'Viewed', 'Accepted', 'Declined', 'Expired'];
export const DOCUMENT_STATUSES = ['active', 'inactive'];
