class HospitalVendorsController < ApplicationController
  before_action :set_hospital_vendor, only: [:show, :update, :destroy]

  # GET /hospital_vendors
  def index
    @hospital_vendors = HospitalVendor.all

    render json: @hospital_vendors
  end

  # GET /hospital_vendors/1
  def show
    @hospital_vendor = HospitalVendor.find(:first, :conditions => ["user_id = ?", @current_user])
    render json: @hospital_vendor
  end

  # POST /hospital_vendors
  def create
    @hospital_vendor = HospitalVendor.new(hospital_vendor_params)
    @hospital_vendor.user_id = current_user.id

    if @hospital_vendor.save
      render json: @hospital_vendor, status: :created
    else
      render json: @hospital_vendor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hospital_vendors/1
  def update
    if @hospital_vendor.update(hospital_vendor_params)
      render json: @hospital_vendor
    else
      render json: @hospital_vendor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hospital_vendors/1
  def destroy
    @hospital_vendor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_vendor
      @hospital_vendor = HospitalVendor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  # t.integer :num_vendors
  #      t.string :state_sales_tax
  #      t.string :county_sales_tax
  #      t.string :municipality_sales_tax
  #      t.string :services
  #      t.boolean :supports_USDA_food_security
  #      t.string :USDA_food_security_how
  #      t.boolean :accepts_WICFMNP
  #      t.string :who_offers_WICFMNP
  #      t.boolean :accepts_seniorFMNP
  #      t.string :who_offers_seniorFMNP
  #      t.boolean :accepts_WICCVV
  #      t.string :who_offers_WICCVV
  #      t.boolean :accepts_vouchers
  #      t.string :list_vouchers_accepted
  #      t.boolean :offers_incentive
  #      t.string :list_incentives_offered
    def hospital_vendor_params
      params.require(:hospital_vendor).permit(:num_vendors, :state_sales_tax, :county_sales_tax, :municipality_sales_tax, :services,
                                              :supports_USDA_food_security, :accepts_WICFMNP, :who_offers_WICFMNP, :accepts_seniorFMNP,
                                              :who_offers_seniorFMNP, :accepts_WICCVV, :who_offers_WICCVV, :accepts_vouchers, :list_vouchers_accepted,
                                              :offers_incentives, :list_incentives_offered)
    end
end
