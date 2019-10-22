class UsersController < ApplicationController
  def edit_user_info
    @user = current_user
    authorize @user
  end

  def update_user_info
    @user = current_user
    authorize @user

    @user.name = params[:user][:name]
    @user.surname = params[:user][:surname]
    @user.school = params[:user][:school]
    @user.save

    redirect_to root_path
  end
end
