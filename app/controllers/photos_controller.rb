class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:model]
      @photos = Photo.where(:model => params[:model]).order("created_at DESC")
    else
      @photos = Photo.all.order("created_at DESC")
    end
  end

  def show
    @disable_nav = true
    @sub_nav = true
  end

  def new
    @photo = current_user.photos.build
  end

  def edit
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo, notice: 'Photo was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find_by(id: params[:id])
    end

    def correct_user
      @photo = current_user.photos.find_by(id: params[:id])
      redirect_to photos_path, notice: "Not authorized to edit this photo" if @photo.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:description, :image)
    end

end
