class VideoPolicy < ApplicationPolicy
  def index?
    @user 
  end

  def create?
    #@user && (! user.jury?)
    false
  end

  def update?
    #@user.id == @record.user_id
    false
  end

  def destroy?
    #@user.id == @record.user_id
    false
  end
end

