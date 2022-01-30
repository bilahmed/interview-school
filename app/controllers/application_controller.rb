class ApplicationController < ActionController::Base
  before_action :current_student

  private

  def current_student
    @student = Student.first
  end
end
