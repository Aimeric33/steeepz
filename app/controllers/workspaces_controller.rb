class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[show update destroy]

  def index
    @workspaces = policy_scope(Workspace)
  end

  def show
    authorize @workspace
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.owner = current_user
    authorize @workspace

    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    authorize @workspace

    if @workspace.update(workspace_params)
      redirect_to workspace_path(@workspace)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @workspace

    @workspace.destroy
    redirect_to workspaces_path
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:name)
  end
end
