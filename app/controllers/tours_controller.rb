class ToursController < ApplicationController
  def index
    @tours=Tour.all
  end

  def new
    @tour= Tour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tour }
    end
  end

  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        # log_in @tours
        flash[:success] = "Welcome to the Tour management system!"
        format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Tour was successfully created.' }
        format.json { render json: @tour, status: :created, location: 'welcome/index' }
      else
        flash.now[:notice] = "Invalid parameters"
        format.html { render action: "new" }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tour = Tour.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tour }
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])

    respond_to do |format|
      if @tour.update_attributes(tour_params)
        format.html { redirect_to @tours, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tours.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    if @tour.destroy
      flash[:notice] = "Successfully deleted tour!"
      redirect_to root_path
    else
      flash[:alert] = "Error deleting tour!"
    end
  end

  def tour_params
    params.require(:tour).permit(:customer_id, :tour_id, :bseats, :bwait_list)
  end
end
