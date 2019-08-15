class RemoveColumnsGroups < ActiveRecord::Migration[6.0]
  def change

    # remove_index :groups, :name
    remove_index :groups, :user_id
    remove_index :groups, :group_category
  end
end



