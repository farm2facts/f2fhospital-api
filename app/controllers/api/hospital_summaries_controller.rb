#module api
#  module V1
    class Api::HospitalSummariesController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_hospital_summary, only: [:show, :update, :destroy]

      # GET /hospital_summaries
      def index
        @hospital_summaries = HospitalSummary.all

        render json: @hospital_summaries
      end

      # GET /hospital_summaries/1
      def show
        @hospital_summary = HospitalSummary.find(:first, :conditions => ["user_id = ?", @current_user])
        render json: @hospital_summary
      end

      # POST /hospital_summaries
      def create
        @hospital_summary = HospitalSummary.new(hospital_summary_params)
        @hospital_summary.user_id = current_user.id
        if @hospital_summary.save
          #puts json: @hospital_summary
          render json: @hospital_summary, status: :created
        else
          #puts current_user.id
          render json: @hospital_summary.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /hospital_summaries/1
      def update
        if @hospital_summary.update(hospital_summary_params)
          render json: @hospital_summary
        else
          render json: @hospital_summary.errors, status: :unprocessable_entity
        end
      end

      # DELETE /hospital_summaries/1
      def destroy
        @hospital_summary.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_hospital_summary
          @hospital_summary = HospitalSummary.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def hospital_summary_params
          params.require(:hospital_summary).permit(:street_addr, :city, :state, :hospital_name,:profile_year, :profile_name, :year_founded, :part_of_HCO, :HCO_name,
                                                   :other_healthcare_entities, :name_other_entities, :hospital_incorporated, :member_of_associations,
                                                   :mission_statement_yn, :mission_statement_loc, :mission_statement, :mission_last_updated, :food_procurement_policy,
                                                   :food_menus, :food_system_staff, :info_requests)
        end
    end
  #end
#end
