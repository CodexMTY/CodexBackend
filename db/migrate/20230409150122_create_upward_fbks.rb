class CreateUpwardFbks < ActiveRecord::Migration[7.0]
  def change
    create_table :upward_fbks, id: :uuid do |t|
      t.references :user, null: false, type: :uuid
      t.float :promedio, null: false
      t.timestamps
    end
  end
end
