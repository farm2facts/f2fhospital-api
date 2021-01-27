class CreateHospitalVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_vendors do |t|
      t.references :user, foreign_key: true
      t.integer :num_vendors
      t.string :state_sales_tax
      t.string :county_sales_tax
      t.string :municipality_sales_tax
      t.string :services
      t.boolean :supports_USDA_food_security
      t.string :USDA_food_security_how
      t.boolean :accepts_WICFMNP
      t.string :who_offers_WICFMNP
      t.boolean :accepts_seniorFMNP
      t.string :who_offers_seniorFMNP
      t.boolean :accepts_WICCVV
      t.string :who_offers_WICCVV
      t.boolean :accepts_vouchers
      t.string :list_vouchers_accepted
      t.boolean :offers_incentive
      t.string :list_incentives_offered
      t.timestamps
    end
  end
end
