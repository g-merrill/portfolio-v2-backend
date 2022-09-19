module Api::V1
  class VisitsController < ApplicationController
    attr_reader :visit

    def create
      @visit = Visit.new(visit_params)
      if visit.save
        render_visit
      else
        render_fail("Failed to create a new visit")
      end
    end

    def index
      visits = Visit.all
      render json: visits
    end

    def show
      find_visit!
      render_visit if visit.present?
    end

    def update
      find_visit!
      if visit_params.present? && visit.update(visit_params)
        render_visit
      else
        render_fail("Failed to update the visit")
      end
    end

    def destroy
      find_visit!
      if visit.present?
        visit.destroy
        render_visit
      end
    end

    private

    def find_visit!
      @visit = Visit.find(params[:id])
    rescue
      render_fail("Visit id: #{params[:id]} not found")
    end

    def render_fail(msg)
      render json: { error: msg }, status: :unprocessable_entity
    end

    def render_visit
      render json: visit
    end

    def visit_params
      params.permit(:name)
    end
  end
end
