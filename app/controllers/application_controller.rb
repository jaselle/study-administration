class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


def js_logged_in
  if(!logged_in?)
    flash[:error] = "Login erforderlich für Rating!"
    render :js => "window.location = '/login'"
  end
end

# proctected sites unauthorized users
 helper_method :not_authorized, :redirect_to_profile
 def not_authorized(text)
 	redirect_to root_path, alert: text
 end
 def redirect_to_profile
 	redirect_to profile_path(@user.profile)
 end
end

