class SectionPolicy < ApplicationPolicy
  def show?
    record.checklist.workspace.owner == user
  end

  def create?
    record.checklist.workspace.owner == user
  end

  def update?
    record.checklist.workspace.owner == user
  end

  def destroy?
    record.checklist.workspace.owner == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
