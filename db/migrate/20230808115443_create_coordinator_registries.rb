class CreateCoordinatorRegistries < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinator_registries do |t|
      t.integer :registry_id
      t.integer :coordinator_id

      t.timestamps
    end
  end
end
