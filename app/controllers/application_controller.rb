class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def title
    @title ||= AppContainer.appname
    Rails.env.production? ? @title : "#{@title} (#{Rails.env})"
  end

  helper_method :title
end
