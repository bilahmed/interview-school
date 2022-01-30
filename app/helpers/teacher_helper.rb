module TeacherHelper
  def teacher_options
    Teacher.pluck(:email, :id)
  end
end
