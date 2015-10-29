class DistrictsController < ApplicationController
	def show


		respond_to do |format|
			format.json do 
				sql = "SELECT row_to_json(fc)
							 FROM ( SELECT 'FeatureCollection' As type, array_to_json(array_agg(f)) As features
							 FROM (SELECT 'Feature' As type
							    , ST_AsGeoJSON(lg.location)::json As geometry
							    , row_to_json((SELECT l FROM (SELECT party_cd) As l
							      )) As properties
							   FROM demog.voters As lg 
							   JOIN demog.constitutes ON lg.id = demog.constitutes.voter_id
							   WHERE demog.constitutes.district_id = #{params[:id]}
							   AND location IS NOT NULL
							   LIMIT 1000) As f )  As fc;"

				json_from_postgres = ActiveRecord::Base.connection.execute(sql)


				results = JSON.parse(json_from_postgres.to_json)[0]["row_to_json"]

				render json: results
			end

			format.html do 
				@district = District.find(params[:id])

				@district_report = {
					contestability_rating: 3
				}
			end
		end
	end

	def index

		sql = "SELECT row_to_json(fc)
					 FROM ( SELECT 'FeatureCollection' As type, array_to_json(array_agg(f)) As features
					 FROM (SELECT 'Feature' As type
					    , ST_AsGeoJSON(lg.location)::json As geometry
					    , row_to_json((SELECT l FROM (SELECT party_cd) As l
					      )) As properties
					   FROM demog.voters As lg 
					   JOIN demog.constitutes ON lg.id = demog.constitutes.voter_id
					   WHERE demog.constitutes.district_id = 9
					   AND location IS NOT NULL
					   LIMIT 10  ) As f )  As fc;"

		json_from_postgres = ActiveRecord::Base.connection.execute(sql)


		results = JSON.parse(json_from_postgres.to_json)[0]["row_to_json"]

		render json: results
	end
end