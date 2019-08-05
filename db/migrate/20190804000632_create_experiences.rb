class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :experience_type
      t.integer :guest_limit
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_free
      t.boolean :is_public
      t.boolean :ada_accessible
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
