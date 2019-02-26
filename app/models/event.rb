class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users
  has_many :users, through: :event_users
  has_many :invitations
end
