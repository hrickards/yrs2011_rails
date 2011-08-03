class PrescriptionsController < ApplicationController
  # GET /prescriptions
  # GET /prescriptions.xml
  def index
    @prescriptions = Prescription.find_all_by_patient_id @user_id

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prescriptions }
    end
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.xml
  def show
    @prescription = Prescription.where( :id => params[:id],
                      :patient_id => @user_id ).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prescription }
    end
  end
end
