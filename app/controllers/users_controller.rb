class UsersController < ApplicationController

  def edit_user_info
    @user = current_user
    authorize @user
  end

  def update_user_info
    @user = current_user
    authorize @user
    @user.update_attributes(name: params[:user][:name], surname: params[:user][:surname])
    redirect_to root_path
  end
end
