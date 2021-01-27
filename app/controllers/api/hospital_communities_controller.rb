class HospitalCommunitiesController < ApplicationController
  before_action :set_hospital_community, only: [:show, :update, :destroy]

  # GET /hospital_communities
  def index
    @hospital_communities = HospitalCommunity.all

    render json: @hospital_communities
  end

  # GET /hospital_communities/1
  def show
    @hospital_community = HospitalCommunity.find(:first, :conditions => ["user_id = ?", @current_user])
    render json: @hospital_community
  end

  # POST /hospital_communities
  def create
    @hospital_community = HospitalCommunity.new(hospital_community_params)
    @hospital_community.user_id = current_user.id
    if @hospital_community.save
      render json: @hospital_community, status: :created
    else
      render json: @hospital_community.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hospital_communities/1
  def update
    if @hospital_community.update(hospital_community_params)
      render json: @hospital_community
    else
      render json: @hospital_community.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hospital_communities/1
  def destroy
    @hospital_community.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_community
      @hospital_community = HospitalCommunity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hospital_community_params
      params.require(:hospital_community).permit(:staffonboard, :list_org_staff, :key_partners, :list_communications, :has_annualreport)
    end
end
