class PhotosController < ApplicationController
  def index
    @photo = Photo.order('created_at')
  end

  #New action for creating a new photo
  def new
    @photo = Photo.new
  end

  #Create action ensures that submitted photo gets created if it meets the requirements
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully added new photo!"
      redirect_to :controller => 'agentoptions', :action => 'index'
    else
      flash[:alert] = "Error adding new photo!"
      flash.now[:notice] = "Invalid parameters"
      render :new
    end
  end

 
  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = "Successfully deleted photo!"
      redirect_to '/photooptions'
    else
      flash[:alert] = "Error deleting photo!"
    end
  end
  #def destroy
  #  @photo = Photo.find(params[:id])
  #  if @photo.destroy
  #    flash[:notice] = "Successfully deleted photo!"
  #    redirect_to root_path
  #  else
  #    flash[:alert] = "Error deleting photo!"
  #  end
  #end

  private

  #Permitted parameters when creating a photo. This is used for security reasons.
  def photo_params
    params.require(:photo).permit(:tour_id, :image)
  end
end
