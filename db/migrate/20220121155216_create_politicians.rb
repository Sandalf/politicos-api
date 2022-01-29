class CreatePoliticians < ActiveRecord::Migration[7.0]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :email
      t.string :legislature
      t.boolean :active
      t.integer :party
      t.date :birth_date
      t.string :telephone
      t.string :photo_url
      t.string :legislative_experience
      t.date :swearing_date
      t.string :academic_preparation
      t.string :location
      t.string :last_degree_of_studies
      t.string :district
      t.string :city
      t.boolean :relative_majority
      t.integer :type
      t.jsonb :social_links

      t.timestamps
    end
  end
end
