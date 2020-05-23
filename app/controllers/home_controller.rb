class HomeController < ApplicationController
  def index
   @events = Event.where(event_verified: true).where("event_date >= ?",Time.new.strftime("%m/%d/%Y"))
  end

  def about
  end
end
