class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :groupname
      t.references :user, foreign_key: true, index:true
      t.text :description
      t.string :group_category, index:true
      t.boolean :active
      t.boolean :private

      t.timestamps
    end
  end
end
