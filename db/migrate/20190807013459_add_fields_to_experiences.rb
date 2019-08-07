class AddFieldsToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :language, :string
    add_column :experiences, :city, :string
    add_reference :experiences, :group, index: true
  end
end
