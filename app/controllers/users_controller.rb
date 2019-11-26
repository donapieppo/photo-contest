class UsersController < ApplicationController
  skip_before_action :user_complete_data

  def index
    authorize :user
    @users = User.order(:surname, :name)
  end

  def edit_user_info
    @user = current_user
    authorize @user
  end

  def update_user_info
    @user = current_user
    authorize @user

    if @user.update(user_params)
      redirect_to root_path
    else
      render action: :edit_user_info
    end
  end

  def edit_release_document
    if current_user.release_document.attached?
      redirect_to root_path
      return
    end
  end

  def submit_release_document
    current_user.update(release_document: params[:user][:release_document])
  end

  def delete_release_document
  end

  def delete_id_card
    @user = current_user
    authorize @user
    @user.id_card.delete
    redirect_to edit_user_info_path
  end

  def release
    pdf = ReleaseLetter.new(current_user)
    filename = "liberatoria_#{current_user.surname}.pdf"
    send_data pdf.render, filename: filename, type: "application/pdf"
  end
  
  private

  def user_params
    params[:user].permit(:name, :surname, :birthdate, :birthplace, :address, :cf, :school, :id_card)
  end

end
