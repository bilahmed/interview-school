module SubjectHelper
  def subject_options
    Subject.pluck(:name, :id)
  end
end
