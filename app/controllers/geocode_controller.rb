class GeocodeController < ApplicationController
  skip_before_filter :get_user
  
  def show
    options = params
    options.delete "action"
    options.delete "controller"
    data = Geocode.geocode options
    render :json => data
  end
end
