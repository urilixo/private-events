class Invite < ApplicationRecord
  scope :confirmed, -> { where('is_confirmed == ?', true) }
  scope :unconfirmed, -> { where.not('is_confirmed == ?', true) }
  belongs_to :attendee, class_name: 'User'
  belongs_to :event
end
