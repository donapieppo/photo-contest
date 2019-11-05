class PhotoPolicy < ApplicationPolicy
  def index?
    @user 
  end

  def create?
    @user && (! user.jury?)
  end

  def update?
    @user.id == @record.user_id
  end

  def destroy?
    @user.id == @record.user_id
  end
end

