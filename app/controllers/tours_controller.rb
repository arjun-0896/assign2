class ToursController < ApplicationController

  def index
    @tours=Tour.all
  end

  def new

    @tours= Tour.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tours }
    end

  end

  def create
    @tours = Tour.new(tours_params)
    #@tours.id =
    respond_to do |format|
      if @tours.save
        format.html { redirect_to @tours, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tours }
      else
        format.html { render :new }
        format.json { render json: @tours.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @tours.update(tour_params)
        format.html { redirect_to @tours, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tours }
      else
        format.html { render :edit }

      end
    end
  end


  def destroy
    @tours.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  INTEGER_MAX = 2147483647
  SIZE_MAPPING = {
      1 => [0, 500],
      2 => [500, 1500],
      3 => [1500, 3000],
      4 => [3000, INTEGER_MAX]
  }
  PRICE_MAPPING = {
      1 => [0, 100000],
      2 => [100000, 250000],
      3 => [250000, 500000],
      4 => [500000, 1000000],
      5 => [1000000, INTEGER_MAX]
  }

  def search
    @sp = params.fetch(:search_params, {})
    @tours = Tour.all
    @tours = @tours.where(:size => SIZE_MAPPING[@sp['size'].to_i][0]...SIZE_MAPPING[@sp['size'].to_i][1]) if @sp['size'].present?
    @tours = @tours.where(['address LIKE ?', "%#{@sp['address']}%"]) if @sp['address'].present? && @sp['address'] != ""
    @tours = @tours.where(:price => PRICE_MAPPING[@sp['price'].to_i][0]...PRICE_MAPPING[@sp['price'].to_i][1]) if @sp['price'].present?
  end

  private

  def set_tour
    @tours = @tours.find(params[:id])
  end


  def tours_params
    params.fetch(:tour, {})
    params.require(:tour).permit(:id, :name, :price, :description, :booking_deadline, :from_date, :to_date, :start_location, :operator_contact, :status)
end
  def show
    @tours = Tour.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tours }
    end
  end

  def edit
    @tours = Tour.find(params[:id])
  end

  def update
    @tours = Tour.find(params[:id])

    respond_to do |format|
      if @tours.update_attributes(tour_params)
        format.html { redirect_to @tours, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tours.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tours.destroy
    respond_to do |format|
      format.html { redirect_to tours_url }
      format.json { head :no_content }
    end
  end
end
