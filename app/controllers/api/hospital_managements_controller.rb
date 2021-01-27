class HospitalManagementsController < ApplicationController
  before_action :authorize_access_request!, except: [:show, :index]
  before_action :set_hospital_management, only: [:show, :update, :destroy]

  # GET /hospital_managements
  def index
    @hospital_managements = HospitalManagement.all

    render json: @hospital_managements
  end

  # GET /hospital_managements/1
  def show
    @hospital_management = HospitalManagement.find(:first, :conditions => ["user_id = ?", @current_user])
    render json: @hospital_management
  end

  # POST /hospital_managements
  def create
    @hospital_management = HospitalManagement.new(hospital_management_params)
    @hospital_management.user_id = current_user.id
    if @hospital_management.save
      render json: @hospital_management, status: :created
    else
      render json: @hospital_management.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hospital_managements/1
  def update
    if @hospital_management.update(hospital_management_params)
      render json: @hospital_management
    else
      render json: @hospital_management.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hospital_managements/1
  def destroy
    @hospital_management.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_management
      @hospital_management = HospitalManagement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hospital_management_params
      params.require(:hospital_management).permit(:num_staff, :manager_ft_yr, :manager_pt_yr, :manager_ft_seasonal,
                                                  :manager_pt_seasonal, :dietician, :chef, :prepcook, :dietaryaid, :other,
                                                  :salaried_staff_hours, :hourly_staff_hours, :food_procurement_budget, :food_budget_allocated,
                                                  :chem_paper_dietary_budget)
    end
end
