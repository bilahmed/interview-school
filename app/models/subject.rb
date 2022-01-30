class Subject < ApplicationRecord
  has_many :teacher_subjects, dependent: :destroy
  has_many :teachers, through: :teacher_subjects
  has_many :sections, dependent: :restrict_with_error

  validates :name, :code, presence: true, uniqueness: true
end
