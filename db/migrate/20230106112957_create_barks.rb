class CreateBarks < ActiveRecord::Migration[7.0]
  def change
    create_table :barks do |t|
      t.text :message, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
