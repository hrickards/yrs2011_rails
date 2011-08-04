class Geocode < Hashie::Mash
  include HTTParty
  base_uri "http://maps.googleapis.com/maps/api/geocode"
  format :json
  
  def self.geocode(query)
    self.new get('/json', :query => query)
  end
    #Get http://maps.googleapis.com/maps/api/geocode/json?options
end
