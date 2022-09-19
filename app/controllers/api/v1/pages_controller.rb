module Api::V1
  class PagesController < ApplicationController
    attr_reader :page

    def create
      @page = Page.new(page_params)
      if page.save
        render_page
      else
        render_fail("Failed to create a new page")
      end
    end

    def index
      pages = Page.all
      render json: pages
    end

    def show
      find_page!
      render_page if page.present?
    end

    def update
      find_page!
      if page_params.present? && page.update(page_params)
        render_page
      else
        render_fail("Failed to update the page")
      end
    end

    def destroy
      find_page!
      if page.present?
        page.destroy
        render_page
      end
    end

    private

    def find_page!
      @page = Page.find(params[:id])
    rescue
      render_fail("Page id: #{params[:id]} not found")
    end

    def render_fail(msg)
      render json: { error: msg }, status: :unprocessable_entity
    end

    def render_page
      render json: page
    end

    def page_params
      params.permit(:name, :parent_page_id)
    end
  end
end
