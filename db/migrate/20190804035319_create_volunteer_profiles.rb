class CreateVolunteerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteer_profiles do |t|
      t.string :tagline
      t.references :user, foreign_key: true, index:true 
      t.timestamps
    end
  end
end
