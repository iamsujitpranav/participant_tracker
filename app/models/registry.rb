class Registry < ApplicationRecord
  has_many :coordinator_registries
  has_many :coordinators, through: :coordinator_registries
	has_many :enrollments
  has_many :participants, through: :enrollments

	validates :name, :location, presence: true
  validates :name, :location,  uniqueness: { case_sensitive: false }

  enum state: { closed: 0, open: 1 }

  scope :closed, -> { where(state: :closed) }
  scope :open, -> { where(state: :open) }
end
