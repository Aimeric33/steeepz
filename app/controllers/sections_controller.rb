class SectionsController < ApplicationController
  before_action :set_section, only: %i[update destroy]

  def create
    @checklist = Checklist.find(params[:id])
    @section = @checklist.sections.new(section_params)
    authorize @section

    @section.save
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
