class HomeController < ApplicationController
  def index
   if Rails.env.production?	
    @country = request.location.country_code
    @city = request.location.city
   end
  end

  def about
  end
end
