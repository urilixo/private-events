class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :created_events
  has_many :invites
  has_many :attendees, through: :invites
end
