class ImagesController < ApplicationController

  # GET /images
  def index
    if !params[:tag].nil?
      @images = Image.tagged_with([params[:tag]], any: true)
    else
      @images = Image.order(created_at: :desc)
    end
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      # success redirect
      redirect_to image_path(@image)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private
    def image_params
      params.require(:image).permit(:url, :tag_list)
    end
end
