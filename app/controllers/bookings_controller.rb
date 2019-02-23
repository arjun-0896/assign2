class BookingsController < ApplicationController
  def index
    @bookings=Booking.all
  end

  def booking_options
    @bookings=Booking.all
  end

  def new
    @booking= Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to '/bookings', notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created, location: 'welcome/index' }
      else
        flash.now[:notice] = "Invalid parameters"
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(booking_params)
        format.html { redirect_to '/bookings', notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      flash[:notice] = "Successfully deleted booking!"
      redirect_to '/bookings'
    else
      flash[:alert] = "Error deleting booking!"
    end
  end

  def booking_params
    params.require(:booking).permit(:customer_id, :tour_id, :bseats, :bwait_list)
  end
end
