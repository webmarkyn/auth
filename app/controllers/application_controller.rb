# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  helper_method :current_user



  def require_login
    redirect_to signin_path, notice: 'Please log in' if cookies.permanent[:token].empty?
  end
end
