class Event < ApplicationRecord
  belongs_to :user
  has_many :attendences, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: "attendences", source: "attendee"
  validates :title, presence:true, uniqueness:true, length: {minimum: 20, maximum:200}
  validates :date, presence:true
  validates :address, presence:true
end

