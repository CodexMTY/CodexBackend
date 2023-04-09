class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :nombre, null: false
      t.string :apellidos, null: false
      t.string :email
      t.string :password_digest, null: false
      t.integer :idm4, null: false
      t.date :cumpleanos
      t.date :fecha_ingreso, null: false
      t.string :estudios, array: true, default: []
      t.string :universidad
      t.references :areaManager, null: false, type: :uuid
      t.string :direccion
      t.string :puesto, null: false
      t.integer :pc_cat, null: false
      t.text :resumen
      t.boolean :key_talent, default: false
      t.string :encuadre
      t.integer :cet
      t.timestamps
    end
  end
end
