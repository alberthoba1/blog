class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  def logged_in?
    !!current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to articles_path, :alert => exception.message }
      end
    end
end
