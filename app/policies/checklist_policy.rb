class ChecklistPolicy < ApplicationPolicy
  def show?
    record.workspace.owner == user
  end

  def create?
    record.workspace.owner == user
  end

  def update?
    record.workspace.owner == user
  end

  def destroy?
    record.workspace.owner == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
