json.array! @notifications do |notification|
  json.id notification.id
  json.actorUrl user_path(notification.recipient)
  json.actor notification.actor.first_name
  json.action notification.action
  json.notifiable do
  json.type "a #{notification.notifiable.class.to_s.downcase}"
  json.title notification.notifiable.title.humanize
  end
  json.url event_path(notification.notifiable, anchor:dom_id(notification.notifiable))
end