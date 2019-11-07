class ThemePolicy < ApplicationPolicy
  def index?
    @user.manager? || @user.jury?
  end

  def show?
    true
  end

  def create?
    @user.manager?
  end

  def update?
    @user.manager?
  end
end


