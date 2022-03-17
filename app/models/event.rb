class Event < ApplicationRecord
  scope :in_the_past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }
  belongs_to :creator, class_name: 'User', inverse_of: :created_events
  has_many :invites, dependent: :destroy
  has_many :attendees, through: :invites
end
