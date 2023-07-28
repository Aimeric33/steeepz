class ChecklistsController < ApplicationController
  before_action :set_checklist, only: %i[show edit update destroy]

  def show
    authorize @checklist
  end

  def create
    @checklist = Checklist.new(checklist_params)
    @checklist.workspace = Workspace.find(params[:id])
    authorize @checklist

    if @checklist.save
      redirect_to checklist_path(@checklist)
    else
      render 'workspaces/show', status: :unprocessable_entity
    end
  end

  def edit
    authorize @checklist
  end

  def update
    authorize @checklist

    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @checklist

    @checklist.destroy
    redirect_to workspace_path(@checklist.workspace)
  end

  private

  def set_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:name, :description, :start_date, :estimated_end_date)
  end
end
