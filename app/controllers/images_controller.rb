class ImagesController < ApplicationController

  # GET /images
  def index
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  def create
    @image = Image.new
    @image.url = image_params[:url]
    if @image.save
      # success redirect
      redirect_to image_path(@image)
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private
    def image_params
      params.require(:image).permit(:url)
    end
end
