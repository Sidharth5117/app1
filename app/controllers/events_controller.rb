class EventsController < ApplicationController


def index
@events = Event.all
end

def new
@event = Event.new
end


def create
@event = Event.new(event_params)
@event.save
end


private
def event_params
params.require(:event).permit(:event_name,:event_date,:event_time,:proof,:category_id,:add_info)
end

end
