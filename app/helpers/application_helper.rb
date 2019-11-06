# frozen_string_literal: true

module ApplicationHelper
  def current_user
    if cookies.permanent[:token]
      @current_user ||= User.find_by remember_token: cookies.permanent[:token]
    else
      @current_user = nil
    end
  end
end
