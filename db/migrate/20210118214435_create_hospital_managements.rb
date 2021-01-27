class CreateHospitalManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_managements do |t|
      t.references :user, foreign_key: true
      t.integer :num_staff
      t.string :manager_ft_yr
      t.string :manager_pt_yr
      t.string :manager_ft_seasonal
      t.string :manager_pt_seasonal
      t.string :dietician
      t.string :chef
      t.string :prepcook
      t.string :dietaryaid
      t.string :other
      t.string :salaried_staff_hours
      t.string :hourly_staff_hours
      t.string :food_procurement_budget
      t.string :food_budget_allocated
      t.string :chem_paper_dietary_budget
      t.timestamps
    end
  end
end

