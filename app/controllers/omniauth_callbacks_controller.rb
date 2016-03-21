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
    @admin = Admin.do_generic_oauth(request.env["omniauth.auth"], current_admin, provider)
    if @admin.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @admin, :event => :authentication
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_admin_session_path
    end
  end

end
