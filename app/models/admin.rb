class Admin < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable,
         :recoverable, :rememberable, :trackable, 
         :validatable

 def self.do_generic_oauth(auth_hash, signed_in_resource = nil, provider)
    admin = Admin.where(:provider => auth_hash.provider, :uid => auth_hash.uid ).first

    return admin if admin

    # twitter's email is nil
    if provider == "twitter"
      email_provider = auth_hash.uid + "@twitter.com"
    else
      email_provider = auth_hash.info.email 
    end
    registered_admin = Admin.where(:email => email_provider).first
    return registered_admin if registered_admin
    # create user
    admin = Admin.create(name: auth_hash.info.name,
      			provider:auth_hash.provider,
      			email: email_provider,
      			uid: auth_hash.uid ,
      			password: Devise.friendly_token[0,20],
                        nickname:auth_hash.info.nickname
    )
 end
end

