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

    # Twitter does not return email so would use nickname instead
    if auth_det.info.nickname.present? and !Admin.exists?(:nickname => auth_det.info.nickname) 
      puts "Nickname not found"
      redirect_to root_path
      return
    end

    if auth_det.info.email.present? and !Admin.exists?(:email => auth_det.info.email) 
      puts "User not allowed"
      redirect_to root_path
      return
    end

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
