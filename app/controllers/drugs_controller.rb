class DrugsController < ApplicationController
  def show
    @title = params[:name]
    @page = Wikipedia.find_overview @title
  end
end
