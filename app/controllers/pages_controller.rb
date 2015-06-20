class PagesController < ApplicationController
  def home
    if params[:model]
      @photos = Photo.where(:model => params[:model]).order("created_at DESC")
    else
      @photos = Photo.all.order("created_at DESC")
    end
  end
  def about
    @photos = Photo.where(:model => "Nexus 6").order("created_at DESC")
  end
end
