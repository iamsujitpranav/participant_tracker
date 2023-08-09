class Coordinator < ApplicationRecord
	has_many :coordinator_registries
  has_many :registries, through: :coordinator_registries
  has_many :enrollments
  has_many :participants, through: :enrollments


	validates :name, :email, :phone_number, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
