class RemoveFieldFromExperiences < ActiveRecord::Migration[6.0]
  def change
    remove_column :experiences, :group
  end
end
