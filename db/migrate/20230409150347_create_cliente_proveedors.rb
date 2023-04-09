class CreateClienteProveedors < ActiveRecord::Migration[7.0]
  def change
    create_table :cliente_proveedors, id: :uuid do |t|
      t.references :user, null: false, type: :uuid
      t.float :promedio
      t.text :comentarios
      t.timestamps
    end
  end
end
