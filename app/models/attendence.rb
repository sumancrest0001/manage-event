class Attendence < ApplicationRecord
  belongs_to :attendee, :class_name => "User"
  belongs_to :attended_event, :class_name => "Event"

  scope :event_joined?, ->(event_id, id) { where('attended_event_id = ? and attendee_id = ?', event_id, id).exists? }
end
