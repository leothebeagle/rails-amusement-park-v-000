class UsersController < ApplicationController

  def show
    #require login here
    if current_user
      @current_user
      render "show"
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin )
  end


end
