class Memberships < ActiveRecord::Migration[6.0]
  def change


    drop_table :group_requests
    drop_table :group_users



    create_table :memberships do |t|
      t.integer :member_id
      t.integer :joined_id

      t.timestamps

    end
    add_index :memberships, :member_id
    add_index :memberships, :joined_id
    add_index :memberships, [:member_id, :joined_id], unique: true


  end
end
