class ChanceDefaultKeyTalent < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :key_talent, false
  end
end
