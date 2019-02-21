class ReviewsController < ApplicationController
  def index
    @reviews=Review.all
  end

  def new
    @review= Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        # log_in @reviews
        flash[:success] = "Welcome to the Tour management system!"
        format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: 'welcome/index' }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @review = Review.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(review_params)
        format.html { redirect_to @reviews, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Successfully deleted review!"
      redirect_to root_path
    else
      flash[:alert] = "Error deleting review!"
    end
  end

  def review_params
    params.require(:review).permit(:name, :email, :password)
  end

end
