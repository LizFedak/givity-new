class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :group, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
