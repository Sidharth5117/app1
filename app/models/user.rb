class User < ApplicationRecord

has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]




def self.create_from_provider_data(provider_data)
 where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
user.email = provider_data.info.email
user.password = Devise.friendly_token[0,20]
end
end








 def update_without_password(params, *options)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end







def full_name
return "#{first_name} #{last_name}" if first_name || last_name
"Anonymous"
end

end
