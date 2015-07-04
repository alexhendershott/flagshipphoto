class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    redirect_to "/"
  end

  def show
    @disable_nav = true
    @sub_nav = true
    # Increasing view count everytime show URL is visited
    @photo.vcount += 1
    @photo.save
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

  def favorite
    respond_to do |format|
      @photo = Photo.find(params[:id])
      if current_user.voted_for? @photo
        format.html {
          flash[:error] = 'You already favorited the photo!'
          redirect_to "/"
        }
        format.js   {

        }
      else
        @favorited = @photo.upvote_by current_user
        format.html {
          flash[:notice] = 'You have favorited the photo.'
          redirect_to "/"
        }
        format.js   {

        }
      end
    end
  end

  # def favorite
  #   @photo = Photo.find(params[:id])
  #   if current_user.voted_for? @photo
  #     flash[:error] = 'You already favorited the photo!'
  #     redirect_to "/"
  #   else
  #     @photo.upvote_by current_user
  #     flash[:notice] = 'You have favorited the photo.'
  #     redirect_to "/"
  #   end
  # end

  #   def favorite
  #   @photo = Photo.find(params[:id])
  #
  #   if @photo.votes.create(user_id: current_user.id)
  #     flash[:notice] =  "Thank you for upvoting!"
  #     redirect_to(photos_path)
  #   else
  #     flash[:notice] =  "You have already upvoted this!"
  #     redirect_to(photos_path)
  #   end
  # end

    # def favorite
    #   respond_to do |format|
    #     @photo = Photo.find(params[:id])
    #     @photo.votes.create
    #       format.html { redirect_to @photos_path, notice: 'The photo has been favorited.' }
    #       format.js   {}
    #     else
    #       format.html { redirect_to @photos_path, notice: 'You have already favorited this photo!' }
    #       format.js   { render status: :500 }
    #     end
    #   end
    # end

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
