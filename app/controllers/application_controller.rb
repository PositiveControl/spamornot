class ApplicationController < ActionController::Base
  before_action :set_values

  def set_values
    session[:incorrect] ||= 0.0
    session[:correct] ||= 0.0
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, :notice => 'Please login or signup to view this article.'
    end
  end
end
