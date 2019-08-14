class CreateNEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :n_events do |t|
      t.string :date
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
