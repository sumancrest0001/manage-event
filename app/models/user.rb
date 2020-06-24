class User < ApplicationRecord
  has_many :events
  has_many :attendences, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: "attendences", source: "attended_event"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
