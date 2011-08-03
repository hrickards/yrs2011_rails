class MapsController < ApplicationController
  skip_before_filter :get_user
  
  def index
  end
end