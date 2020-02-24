class UserPolicy < ApplicationPolicy

  def index?
    @user.jury_or_manager?
  end

  def show?
    @user.jury_or_manager?
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

  def destroy?
    @user.manager?
  end

end
