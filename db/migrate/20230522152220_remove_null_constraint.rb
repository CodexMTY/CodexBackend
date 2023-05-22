class RemoveNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :estructura3, true
    change_column_null :users, :estructura4, true
    change_column_null :users, :estructura5, true
    change_column_null :users, :fecha_ingreso, true
    change_column_null :users, :puesto, true
    change_column_null :users, :pc_cat, true
    change_column_null :users, :idm4, true
  end
end
