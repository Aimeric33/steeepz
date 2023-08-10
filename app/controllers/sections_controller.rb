class SectionsController < ApplicationController
  before_action :set_section, only: %i[update destroy]

  def create
    @checklist = Checklist.find(params[:checklist_id])
    @section = @checklist.sections.new(section_params)
    authorize @section

    if @section.save
      redirect_to edit_checklist_path(@checklist)
    else
      render 'checklists/edit', status: :unprocessable_entity
    end
  end

  def update
    @checklist = Checklist.find(params[:checklist_id])
    authorize @section

    if @section.update(section_params)
      redirect_to edit_checklist_path(@checklist)
    else
      render 'checklists/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @checklist = Checklist.find(params[:checklist_id])
    authorize @section

    @section.destroy
    redirect_to edit_checklist_path(@checklist)
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end

  def set_section
    @section = Section.find(params[:id])
  end
end
