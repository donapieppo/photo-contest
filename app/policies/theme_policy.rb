class ThemePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.manager?
  end

  def update?
    @user.manager?
  end
end


