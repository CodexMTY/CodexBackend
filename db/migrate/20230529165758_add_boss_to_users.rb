class AddBossToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jefe, :string, default: "", null: false
  end
end
