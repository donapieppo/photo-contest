class UsersController < ApplicationController
  skip_before_action :user_complete_data

  def edit_user_info
    @user = current_user
    authorize @user
  end

  def update_user_info
    @user = current_user
    authorize @user

    @user.update(user_params)

    redirect_to root_path
  end

  def release
    pdf = ReleaseLetter.new(current_user)
    filename = "liberatoria_#{current_user.surname}.pdf"
    send_data pdf.render, filename: filename, type: "application/pdf"
  end
  
  private

  def user_params
    params[:user].permit(:name, :surname, :birthdate, :birthplace, :cf, :address, :school)
  end

end
