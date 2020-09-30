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
    return "#{user.first_name} #{user.last_name}".capitalize
  end


  def display_buttons(event)
    if current_user == event.user
      (link_to 'Show', event_path(event), class: "btn-sm btn-primary") + 
      (link_to "Update", edit_event_path(event), class: "ml-2 btn-sm btn-success") +
      (link_to 'Delete', event_path(event),
            data: {confirm: 'Are you sure?'}, method: :delete, class: "ml-2 btn-sm btn-danger")
  
    end
  end


  def display_join_button (event, css_class)
    if current_user
      return (button_to "Join Event", event_attendences_path(event), class: css_class, method: :post) unless event.attendees.include?(current_user) || already_happened?(event)
      raw("<button type='button' class=#{css_class} disabled>Already Joined</button>")
    else
      return (button_to "Join Event", event_attendences_path(event), class: css_class, method: :post) 
    end
  end

  def already_happened? event
    event.date < DateTime.now
  end
end
