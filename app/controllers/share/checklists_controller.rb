class Share::ChecklistsController < ApplicationController
  def show
    @checklist = Checklist.find(params[:id])
  end
end
