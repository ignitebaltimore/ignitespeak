class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    social_callback("twitter")
    return
  end

  def google
    social_callback("google")
    return
  end

  def social_callback(provider)
    auth_det = request.env["omniauth.auth"]
    puts "111111111111111111111111111111111111111111"
    puts auth_det.info.nickname
    puts auth_det.info.email
  
    # if both nickname and email are absent
    if auth_det.info.nickname.blank? and auth_det.info.email.blank?
      redirect_to root_path
      return
    end
    puts "HERE1:"
#    puts  Admin.where(:nickname => "Alas")
 #   puts Admin.where("admins.nickname IS NOT NULL")
#    Admin.includes(:bar).where.not('bars.id' => nil)
  #  puts k[:nickname]
    puts ActiveRecord::Base.connection.execute("Select * from admins")
#    puts "over"
    # Twitter does not return email so would use nickname instead
    if auth_det.info.nickname.present? and !Admin.exists?(:nickname => auth_det.info.nickname) 
      puts "Nickname not found"
      redirect_to root_path
      return
    end
    puts "2222222222222222222222222222222222"
    if auth_det.info.email.present? and !Admin.exists?(:email => auth_det.info.email) 
      puts "User not allowed"
      redirect_to root_path
      return
    end


    if auth_det.info.nickname.present? and !Admin.exists?(:nickname => auth_det.info.nickname) and uth_det.info.email.present? and !Admin.exists?(:email => auth_det.info.email)
      puts "Email and nickname not allowed"
      redirect_to root_path
      return
    end

    puts "333333333333333333333333333333333333333333"

    @admin = Admin.do_generic_oauth(auth_det, current_admin, provider)
    if @admin.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @admin, :event => :authentication
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_admin_session_path
    end
  end

end
