class ThemePolicy < ApplicationPolicy
  def index?
    @user.manager? || @user.jury?
  end

  def create?
    @user.manager?
  end

  def update?
    @user.manager?
  end
end


