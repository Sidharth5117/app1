class CategoriesController < ApplicationController
before_action :require_admin, except: [:index,:show]

def index
@categories = Category.all
end

def new
@category = Category.new
end


def create
@category = Category.new(category_params)
if @category.save
redirect_to categories_path

else
render 'new'
end

end


def show
@category = Category.find(params[:id])
@category_events = @category.events.where(event_verified: true)


end



private 
def category_params
params.require(:category).permit(:name)
end


def require_admin
if !user_signed_in? || ( user_signed_in? and !current_user.admin? )
redirect_to categories_path 
end
end

end
