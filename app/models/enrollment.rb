class Enrollment < ApplicationRecord
	belongs_to :coordinator
  belongs_to :participant
	belongs_to :registry

	validates :date_of_enrollment, :method_of_contact, presence: true
  validates :registry_id, uniqueness: { scope: :participant_id }
end

