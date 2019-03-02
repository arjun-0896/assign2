class SearchesController < ApplicationController
  #before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @search = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    #@search = Search.find(params[:id])
    @search = Tour.all.select{ |c| c.tour_id.to_i == params[:tour].to_i}
    #puts "*************************************", @photo, params[:tour]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
    end

  # GET /searches/new
  def new
    @search = Search.new

    @locations = Tour.distinct.pluck(:start_location)

  end


  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)
    redirect_to @search
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search

    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:start_location, :price)
    end
end
