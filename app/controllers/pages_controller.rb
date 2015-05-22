class PagesController < ApplicationController
  def home
    @pins = Pin.all
  end
  def about
  end
end
