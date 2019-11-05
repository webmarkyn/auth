# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by remember_token: cookies.permanent[:token]
    else
      @current_user = nil
    end
  end

  def require_login
    redirect_to signin_path, notice: 'Please log in' if cookies.permanent[:token].empty?
  end
end
