class QrcodeController < ApplicationController
  skip_before_filter :get_user
  
  require "#{RAILS_ROOT}/lib/verify.rb"
  
  def show
    @verify = verify(params[:id], params[:signed_id])
    @prescription = Prescription.find params[:id]
    if @verify[:valid] == true
      notice = "Prescription electronically signed by doctor #{@verify[:email]}"
      redirect_to patient_prescription_path(@prescription.patient_id, params[:id]), :notice => notice
    end
  end
end
