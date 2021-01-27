class CreateHospitalSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_summaries do |t|
      t.references :user, foreign_key: true
      t.string :street_addr
      t.string :city
      t.string :state
      t.string :hospital_name
      t.string :profile_year
      t.string :profile_name
      t.string :year_founded
      t.boolean :part_of_HCO
      t.string :HCO_name
      t.boolean :other_healthcare_entities
      t.string :name_other_entities
      t.string :hospital_incorporated
      t.string :member_of_associations
      t.boolean :mission_statement_yn
      t.string :mission_statement_loc
      t.string :mission_statement
      t.string :mission_last_updated
      t.string :food_procurement_policy
      t.string :food_menus
      t.string :food_system_staff
      t.string :info_requests

      #t.string :logo_name
      #t.string :logo_content_type
      #t.binary :logo_data
      t.timestamps
    end
  end
end
