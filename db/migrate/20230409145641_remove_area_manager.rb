class RemoveAreaManager < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :areaManager_id
  end
end
