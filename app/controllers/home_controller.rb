class HomeController < ApplicationController
  def index
   if Rails.env.production?	
    @country = request.location.country
    @city = request.location.city
   end
  end

  def about
  end
end
