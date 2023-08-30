class StepPolicy < ApplicationPolicy
  def create?
    record.section.checklist.workspace.owner == user
  end

  def update?
    record.section.checklist.workspace.owner == user
  end

  def destroy?
    record.section.checklist.workspace.owner == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
