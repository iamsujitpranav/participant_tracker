class Participant < ApplicationRecord
	has_many :enrollments
  has_many :coordinators, through: :enrollments
  has_many :registries, through: :enrollments

	validates :name, :gender, :date_of_birth, presence: true
  validates :name, uniqueness: { scope: :date_of_birth, case_sensitive: false }
end

