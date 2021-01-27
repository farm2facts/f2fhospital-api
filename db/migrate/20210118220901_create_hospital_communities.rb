class CreateHospitalCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_communities do |t|
      t.references :user, foreign_key: true
      t.boolean :staffonboard
      t.string :list_org_staff
      t.string :key_partners
      t.string :list_communications
      t.boolean :has_annualreport

      #t.string :annual_report
      #t.string :annual_report_type
      #t.binary :annual_report_data
      t.timestamps
    end
  end
end
