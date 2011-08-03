class QrcodeController < ApplicationController
  require "#{RAILS_ROOT}lib/verify.rb"
  
  def show
    @verify = verify(params[:id], params[:signed_id])
    @prescription = Prescription.find params[:id]
    if @verify[:valid] == true
      notice = "Prescription electronically signed by doctor #{@verify[:email]}"
      redirect_to prescription_path(params[:id]), :notice => notice
    end
  end
end
