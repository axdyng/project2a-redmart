class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper

  private

  def require_login
    #check if the user is logged in or not
    unless logged_in?
      flash[:danger] = "WHAT CHU DOING? Please log in."
      redirect_to root_url # halts request cycle
    end
  end

  def require_logout
    if logged_in?
      flash[:warning] = "Log out first."
      redirect_to(root_url)
    end
  end

end
