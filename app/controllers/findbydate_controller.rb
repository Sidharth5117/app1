class FindbydateController < ApplicationController


def index

end


def search
 if params[:event_date].blank?
    redirect_to findbydate1_path
  else

    @parameter = params[:event_date]
     @results = Event.all.where(event_verified: true).where("event_date = ?",@parameter)


  end
end

end
