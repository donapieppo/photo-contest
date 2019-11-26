class UserPolicy < ApplicationPolicy

  def index?
    @user.manager? 
  end

  def edit_user_info?
    @user.id == @record.id
  end

  def update_user_info?
    @user.id == @record.id
  end

  def delete_id_card?
    @user.id == @record.id
  end

end
