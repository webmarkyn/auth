# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      cookies.permanent[:token] = @user.remember_token
      redirect_to posts_path, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      format.html { render :new }
    end
  end

  def destroy
    cookies.delete :token
    redirect_to posts_path, notice: 'Logged out!'
  end
end
