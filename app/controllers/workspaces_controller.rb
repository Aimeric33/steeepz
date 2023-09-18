class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[show update destroy]
  before_action :show_sidebar, only: %i[index show]

  def index
    @workspaces = policy_scope(Workspace)
  end

  def show
    authorize @workspace
  end

  def create
    @workspace = Workspace.new
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

    @workspace.update(workspace_params)
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

  def show_sidebar
    @show_sidebar = true
  end
end
