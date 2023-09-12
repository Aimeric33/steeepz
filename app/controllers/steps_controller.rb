class StepsController < ApplicationController
  before_action :set_step, only: %i[update destroy]

  def create
    @section = Section.find(params[:section_id])
    @step = @section.steps.new(step_params)
    @step.position = @section.steps.count + 1
    authorize @step

    respond_to do |format|
      format.json if @step.save
    end
  end

  def update
    authorize @step

    @step.update(step_params)
  end

  def destroy
    authorize @step

    @step.destroy
  end

  private

  def step_params
    params.require(:step).permit(:title, :position)
  end

  def set_step
    @step = Step.find(params[:id])
  end
end
