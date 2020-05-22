# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up

before_action :set_user, only: [:verifyclub, :edit, :update, :updateclub]
before_action :require_same_user, only: [ :edit, :update, :verifyclub, :updateclub]
before_action :require_admin, only: [ :unverifiedclubs, :adminverifyclub, :adminupdateclub ]

 def index
@users = User.where(club_verified: true)

end


def unverifiedclubs

@users = User.where(club_verified: false).where.not(club_name: nil,club_site: nil)

end



def adminverifyclub
@user = User.find(params[:id])

end


def adminupdateclub
@user = User.find(params[:id])
@user.toggle(:club_verified)
if @user.save
flash[:notice] = "You Verified " + @user.club_name
redirect_to unverifiedclubs_path
else
render 'adminverifyclub'
end

end




def show
@user = User.find(params[:id])
@events = @user.events.where(event_verified: true).where("event_date > ?",Time.new.strftime("%m/%d/%Y"))

end


   def new
     super
   end

  # POST /resource
   def create
     super
  end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update


self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

resource_updated =  update_resource(resource, account_update_params)

    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end



   end

  # DELETE /resource
   def destroy
     super
   end



def verifyclub
@user = User.find(params[:id])
end


def updateclub
@user = User.find(params[:id])
if @user.update(club_params)
flash[:notice] = "Request for verify of club has been sent!"
redirect_to root_path
else
render 'verifyclub'
end
end




def account_update_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end


def club_params
params.require(:user).permit(:club_name,:club_site)

end

def verify_param
params.require(:user).permit(:club_verified)
end



def require_same_user
   if !user_signed_in? or (user_signed_in? and current_user != @user)  
   flash[:notice] = "You can Verify only your club"
   redirect_to root_path
   end
  end



def set_user
@user = User.find(params[:id])
end




def require_admin
   if !user_signed_in? || (user_signed_in? && !current_user.admin?)
   flash[:notice] = "Only admin users have this privelege"
   redirect_to root_path
   end
   end



  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

  protected



 def update_resource(resource, params)
    resource.update_without_password(params)
end





  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
