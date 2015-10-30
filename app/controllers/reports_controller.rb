class ReportsController < ApplicationController
	def show
		@district = District.find(params[:district_id])
		@report = @district.reports.find(params[:id])
	end

	def index
		@reports = Report.joins(:district).all.order("districts.number")
	end
end