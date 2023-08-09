# Clear existing data
Enrollment.destroy_all
CoordinatorRegistry.destroy_all
Coordinator.destroy_all
Participant.destroy_all
Registry.destroy_all

# Create coordinators
coordinators = [
  { name: "John Doe", email: "john@example.com", phone_number: "123-456-7890" },
  { name: "Jane Smith", email: "jane@example.com", phone_number: "987-654-3210" },
  # Add more coordinators
]

coordinator_instances = coordinators.map do |coordinator_data|
  Coordinator.create!(coordinator_data)
end

# Create registries
registries = [
  { name: "Open Registry 1", location: "Location A", state: 1 },
  { name: "Closed Registry 1", location: "Location B", state: 0},
  # Add more registries
]

registry_instances = registries.map do |registry_data|
  Registry.create!(registry_data)
end


# Associate coordinators with registries
registry_instances.each do |registry|
  coordinator_instances.sample(2).each do |coordinator|
    CoordinatorRegistry.create!(registry: registry, coordinator: coordinator)
  end
end


# Create participants
participants = [
  { name: "Alice Johnson", gender: "female", date_of_birth: Date.new(1990, 5, 15), registry_id: Registry.first.id, coordinator_id: Coordinator.first.id },
  { name: "Bob Smith", gender: "male", date_of_birth: Date.new(1985, 10, 8), registry_id: Registry.second.id, coordinator_id: Coordinator.second.id },
  # Add more participants
]

participant_instances = participants.map do |participant_data|
  Participant.create!(participant_data)
end


# Create enrollments
enrollments = [
  { coordinator_id: Coordinator.first.id, participant: participant_instances.first, registry_id: Registry.first.id , date_of_enrollment: Date.today, method_of_contact: "email", remarks: "Enrolled via email" },
  { coordinator_id: Coordinator.second.id, participant: participant_instances.second, registry_id: Registry.second.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrolled via phone" },
  # Add more enrollments
]

enrollments.each do |enrollment_data|
  Enrollment.create!(enrollment_data)
end
