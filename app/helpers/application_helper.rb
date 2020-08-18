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


  def display_buttons(event)
    if current_user == event.user
      (link_to 'Show', event_path(event), class: "btn-sm btn-primary") + 
      (link_to "Update", edit_event_path(event), class: "ml-2 btn-sm btn-success") +
      (link_to 'Delete', event_path(event),
            data: {confirm: 'Are you sure?'}, method: :delete, class: "ml-2 btn-sm btn-danger")
  
    end
  end
end
