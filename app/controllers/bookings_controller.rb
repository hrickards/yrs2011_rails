class BookingsController < ApplicationController
  
  before_filter :get_gp
  
  # GET /gps/1/bookings
  # GET /gps/1/bookings.ics
  def index
    
    respond_to do |format|
      format.html {  }
      format.ics {
        @bookings = Booking.where( :user_id => params[:patient_id]).where( "time > ?",
                      Time.now )
        @calendar = Icalendar::Calendar.new
    
        @bookings.each do |booking|
          event = Icalendar::Event.new
          event.start = booking.time.strftime("%Y%m%dT%H%M%S")
          event.start = (booking.time + 15.minutes).strftime("%Y%m%dT%H%M%S")
          event.summary = "GP Appointment"
          event.description = booking.message
          event.location = @gp_location
          @calendar.add event
        end
    
        @calendar.publish
          render :text => @calendar.to_ical
      }
    end
  end

  # GET /gps/1/bookings/1
  def show
    @booking = Booking.find(params[:id])
  end

  # GET /gps/1/bookings/new
  def new
    @booking = Booking.new
    # If the time to create the new appointment for is preset, use it
    @time = params[:time] unless params[:time].nil?
  end

  # GET /gps/1/bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /gps/1/bookings
  def create
    preset_options = { :user_id => params[:patient_id], :gp_id => @gp_id }
    options = params[:booking].merge preset_options
    
    @booking = Booking.new options

    if @booking.save
      redirect_to patient_gp_booking_path(:patient_id => params[:patient_id],
        :gp_id => @gp_id, :id => @booking.id), 
        :notice => 'Booking was successfully created.'
    else
      render :action => "new" 
    end
  end

  # PUT /gps/1/bookings/1
  def update
    @booking = Booking.find(params[:id])

    if @booking.update_attributes(params[:booking])
      redirect_to @booking, :notice => 'Booking was successfully updated.'
    else
      render :action => "edit"
    end
  end
  
  private
  def get_gp
    @gp_id = params[:gp_id]
    @gp_location = "TN22 2HT"
    @gp_name = "Dr. Jarvis"
  end
end
