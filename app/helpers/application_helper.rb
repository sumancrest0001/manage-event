module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Events'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def avatar_url(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def name (user)
    return "#{user.first_name} #{user.last_name}"
  end
end
