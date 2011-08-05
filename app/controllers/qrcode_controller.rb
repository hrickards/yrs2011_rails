class QrcodeController < ApplicationController
  skip_before_filter :get_user
  
  def show
    @prescription = Prescription.find params[:id]
    notice = "Prescription electronically signed by doctor hrickards+foobar@gmail.com"
    redirect_to patient_prescription_path(@prescription.patient_id, params[:id]), :notice => notice
  end
end
