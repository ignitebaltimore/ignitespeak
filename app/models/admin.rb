class Admin < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable,
         :recoverable, :rememberable, :trackable, 
         :validatable

 def self.do_twitter_oauth(auth, signed_in_resource = nil)
  admin = Admin.where(:provider => auth.provider, :uid => auth.uid).first

  return admin if admin

  registered_admin = Admin.where(:email => auth.uid + "@twitter.com").first

  return registered_admin if registered_admin
 
  # create user
  admin = Admin.create(name:auth.info.name,
    			provider:auth.provider,
    			uid:auth.uid,
    			email:auth.uid+"@twitter.com",
    			password:Devise.friendly_token[0,20]
  )
 end

 def self.do_google_oauth2(access_token, signed_in_resource = nil)
    data = access_token.info
    admin = Admin.where(:provider => access_token.provider, :uid => access_token.uid ).first

    return admin if admin

    registered_admin = Admin.where(:email => access_token.info.email).first

    return registered_admin if registered_admin

    # create user
    admin = Admin.create(name: data["name"],
      			provider:access_token.provider,
      			email: data["email"],
      			uid: access_token.uid ,
      			password: Devise.friendly_token[0,20]
    )
 end

end

