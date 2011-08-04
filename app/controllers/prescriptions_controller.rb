class PrescriptionsController < ApplicationController
  # GET /prescriptions
  # GET /prescriptions.xml
  def index
    @prescriptions = Prescription.find_all_by_patient_id params[:patient_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prescriptions }
    end
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.xml
  def show
    require 'google-qr'
    require "#{RAILS_ROOT}/lib/qr_methods.rb"
    
    @prescription = Prescription.where( :id => params[:id],
                      :patient_id => params[:patient_id] ).first
                      
    id = @prescription.id
    signed_output = @prescription.signature
    signed_id_trunc = signed_output.lines.to_a[3..-2].join.gsub(/\n/,'')[-15,15]
    @image_path = qr_code_from_id id, signed_id_trunc 

  end
end
