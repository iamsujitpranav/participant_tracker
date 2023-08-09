class CreateRegistries < ActiveRecord::Migration[7.0]
  def change
    create_table :registries do |t|
      t.string :name, unique: true
      t.string :location, unique: true
      t.integer :state, default: 0, null: false

      t.timestamps

    end
  end
end
