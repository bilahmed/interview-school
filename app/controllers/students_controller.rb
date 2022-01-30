class StudentsController < ApplicationController
  before_action :set_section, only: %i[add_section remove_section]

  def add_section
    @student_section = current_student.student_sections.build(section: @section)

    if @student_section.save
      redirect_to sections_path, notice: "Section was successfully added to the schedule."
    else
      redirect_to sections_path, alert: @student_section.errors.full_messages.to_sentence
    end
  end

  def remove_section
    if current_student.sections.delete(@section)
      redirect_to sections_path, notice: "Section was successfully removed from the schedule."
    else
      redirect_to sections_path, alert: "Section cannot be removed from the schedule."
    end
  end

  def schedule
    @booked_times = current_student.booked_times.includes(section: [:subject, :teacher, :class_room])
  end

  private

  def set_section
    @section = Section.find(params[:section_id])
  end
end
