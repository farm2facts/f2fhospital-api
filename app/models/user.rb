class User < ApplicationRecord
  has_secure_password
  has_many :hospital_summaries, dependent: :destroy
  has_many :hospital_managements, dependent: :destroy
  has_many :hospital_vendors, dependent: :destroy
  has_many :hospital_communities, dependent: :destroy
end
