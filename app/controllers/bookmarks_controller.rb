class BookmarksController < ApplicationController
  def index
    @bookmarks=Bookmark.all
  end

  def new
    @bookmark= Bookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bookmark }
    end
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to '/bookmarks', notice: 'Bookmark was successfully created.' }
        format.json { render json: @bookmark, status: :created, location: 'welcome/index' }
      else
        flash.now[:notice] = "Invalid parameters"
        format.html { render action: "new" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bookmark }
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(bookmark_params)
        format.html { redirect_to '/bookmarks', notice: 'Bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Successfully deleted bookmark!"
      redirect_to '/bookmarks'
    else
      flash[:alert] = "Error deleting bookmark!"
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:customer_id, :tour_id)
  end
end
