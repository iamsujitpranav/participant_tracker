class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :gender
      t.date :date_of_birth

      t.timestamps

      t.references :registry, null: false, foreign_key: true
      t.references :coordinator, null: false, foreign_key: true
    end
  end
end
