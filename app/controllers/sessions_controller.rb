class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to show_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end





  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
