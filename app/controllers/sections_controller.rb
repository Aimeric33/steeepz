class SectionsController < ApplicationController
  before_action :set_section, only: %i[update destroy]

  def create
    @checklist = Checklist.find(params[:checklist_id])
    @section = @checklist.sections.new(section_params)
    @section.position = @checklist.sections.count + 1
    authorize @section

    respond_to do |format|
      format.json if @section.save
    end
  end

  def update
    authorize @section

    @section.update(section_params)
  end

  def destroy
    authorize @section

    @section.destroy
  end

  private

  def section_params
    params.require(:section).permit(:title, :position)
  end

  def set_section
    @section = Section.find(params[:id])
  end
end
