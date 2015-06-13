class PagesController < ApplicationController
  def home
    if params[:model]
      @photos = Photo.where(:model => params[:model])
    else
      @photos = Photo.all
    end
  end
  def about
    @photos = Photo.where(:model => "Nexus 6")
  end
end
