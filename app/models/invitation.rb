class Invitation < ApplicationRecord
  belongs_to :event

  validates :token, presence: true, uniqueness: true
end
