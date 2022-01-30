class TeacherSubject < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject

  validates :teacher, uniqueness: { scope: :subject }
end
