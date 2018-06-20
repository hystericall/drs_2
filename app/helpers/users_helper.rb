module UsersHelper
  def gravatar_for user, options = {size: Settings.avatar_size}
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def is_admin_not_current? user
    current_user.admin? && !current_user?(user)
  end

  def is_manager_admin? user
    user.manager? || user.admin?
  end

  def check_user
    @user ||= current_user
  end
end
