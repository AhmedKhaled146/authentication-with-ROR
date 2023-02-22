class RegistrationsController < ApplicationController
  # before_action :set_user, :only [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html {redirect_to root_path}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end



end
