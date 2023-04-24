class ChangeColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :estructura3, :string, null: false
    add_column :users, :estructura4, :string, null: false
    add_column :users, :estructura5, :string, null: false
  end
end
