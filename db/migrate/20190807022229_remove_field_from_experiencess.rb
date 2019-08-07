class RemoveFieldFromExperiencess < ActiveRecord::Migration[6.0]
  def change
    remove_column :experiences, :group_id
    remove_column :experiences, name: "index_experiences_on_group_id"
  end
end
