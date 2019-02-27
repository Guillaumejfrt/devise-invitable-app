class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :guest_name, presence: true
  validates :user, uniqueness: { scope: :event, message: "user already invited to this event" }
end
