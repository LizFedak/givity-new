class AddInfoFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :headline, :string
    add_column :users, :phone_visible, :boolean
    add_column :users, :email_visible, :boolean
    add_column :users, :birthday_month, :string
    add_column :users, :birthday_date, :integer
    add_column :users, :birthday_visible, :boolean
  end
end
