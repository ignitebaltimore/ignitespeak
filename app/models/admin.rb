class Admin < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable,
         :recoverable, :rememberable, :trackable, 
         :validatable

 def self.do_twitter_oauth(auth, signed_in_resource = nil)
  admin = Admin.where(:provider => auth.provider, :uid => auth.uid).first
  if admin
    return admin
  else
    registered_admin = Admin.where(:email => auth.uid + "@twitter.com").first
    if registered_admin
      return registered_admin
    else
      # create user
      admin = Admin.create(name:auth.info.name,
        			provider:auth.provider,
        			uid:auth.uid,
        			email:auth.uid+"@twitter.com",
        			password:Devise.friendly_token[0,20]
      )
    end
  end
 end

 def self.do_google_oauth2(access_token, signed_in_resource = nil)
    data = access_token.info
    admin = Admin.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if admin
      return admin
    else
      registered_admin = Admin.where(:email => access_token.info.email).first
      if registered_admin
        return registered_admin
      else
        # create user
        admin = Admin.create(name: data["name"],
          			provider:access_token.provider,
          			email: data["email"],
          			uid: access_token.uid ,
          			password: Devise.friendly_token[0,20]
        )
      end
   end
 end
end
