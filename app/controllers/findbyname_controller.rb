class FindbynameController < ApplicationController


def index

end


def search
 if params[:event_name].blank?  
    redirect_to findbyname1_path  
  else  

    @parameter = params[:event_name].downcase  
     @results = Event.all.where(event_verified: true).where("lower(event_name) LIKE ?", "%" + @parameter + "%").where("event_date >= ?",Time.new.strftime("%m/%d/%Y"))

    
  end  
end

end
