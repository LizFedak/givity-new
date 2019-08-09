class DropMemberships < ActiveRecord::Migration[6.0]
  def change
    drop_table :memberships
  end
end
