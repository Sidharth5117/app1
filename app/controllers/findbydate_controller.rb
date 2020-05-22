class FindbydateController < ApplicationController




def index

end

def show
@events = Event.where(:event_date => params[:event_date])
end





end
