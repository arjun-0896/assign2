class PhotooptionsController < ApplicationController
  def index
    @photo = Photo.all
  end
end
