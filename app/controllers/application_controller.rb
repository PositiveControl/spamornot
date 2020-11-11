class ApplicationController < ActionController::Base

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, :notice => 'Please login or signup to view this article.'
    end
  end
end
