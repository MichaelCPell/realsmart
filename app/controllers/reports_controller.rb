class ReportsController < ApplicationController
	def show
		@district = District.find(params[:district_id])
		@report = @district.reports.find_by(name: params[:id])
	end
end