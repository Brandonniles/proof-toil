json.extract! location, :id, :address, :city, :state, :latitude, :longitude, :created_at, :updated_at
json.url location_url(location, format: :json)
