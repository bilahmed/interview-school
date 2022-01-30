class SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update destroy]

  def index
    @sections = Section.includes(:subject, :teacher, :class_room, :available_times)
    @available_times_hash = AvailableTime.all.group_by(&:section_id)
  end

  def show; end

  def new
    @section = Section.new
    @section.available_times.build
  end

  def edit; end

  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to section_path(@section), notice: "Section was successfully created."
    else
      render :new
    end
  end

  def update
    if @section.update(section_params)
      redirect_to section_path(@section), notice: "Section was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @section.destroy
      redirect_to sections_path, notice: "Section was successfully destroyed."
    else
      redirect_to sections_path, alert: @section.errors.full_messages.to_sentence
    end
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name, :subject_id, :teacher_id, :class_room_id,
      available_times_attributes: [:id, :_destroy, :day, :start_time, :end_time]
    )
  end
end
