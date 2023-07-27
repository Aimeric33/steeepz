class WorkspacePolicy < ApplicationPolicy
  def show?
    record.owner == user
  end

  def create?
    record.owner == user
  end

  def update?
    record.owner == user
  end

  def destroy?
    record.owner == user
  end

  class Scope < Scope
    def resolve
      scope.where(owner: user)
    end
  end
end
