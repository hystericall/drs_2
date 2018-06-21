module ApplicationHelper
  def full_title page_title
    base_title = I18n.t ".maintitle"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end
end
