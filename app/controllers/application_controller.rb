class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_user
  
  def set_user
    @user_id = 1
    @name = "Harry Rickards"
    @address_line_one = "105 Parklands"
    @town = "Maresfield"
    @county = "East Sussex"
    @postcode = "TN22 2HT"
  end
end
