class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth = env["omniauth.auth"]
    @admin = Admin.do_twitter_oauth(request.env["omniauth.auth"],current_admin)
    if @admin.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @admin, :event => :authentication
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_admin_registration_url
    end
  end

  def google
    @admin = Admin.do_google_oauth2(request.env["omniauth.auth"], current_admin)
    if @admin.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @admin, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_admin_registration_url
    end
  end
end

