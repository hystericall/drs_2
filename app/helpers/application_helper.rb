module ApplicationHelper
  def full_title page_title
    base_title = I18n.t ".maintitle"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def user_filter
    {by_user_name: t("name"), by_user_code: t("user_code")}
  end
end
