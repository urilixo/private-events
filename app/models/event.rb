class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :created_events
  has_many :invites, dependent: :destroy
  has_many :attendees, through: :invites
end
