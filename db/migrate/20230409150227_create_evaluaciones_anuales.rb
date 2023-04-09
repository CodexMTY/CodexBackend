class CreateEvaluacionesAnuales < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluaciones_anuales, id: :uuid do |t|
      t.references :user, null: false, type: :uuid
      t.integer :ano, null: false
      t.integer :performance, null: false
      t.string :potencial, null: false
      t.string :curva, null: false
      t.timestamps
    end
  end
end
