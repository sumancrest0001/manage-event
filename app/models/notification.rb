class Notification < ApplicationRecord
  belongs_to :recipient, class: "user"
  belongs_to :actor, class: "user"
  belongs_to :notifiable, polymerphic: true
end
