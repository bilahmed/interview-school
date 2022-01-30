class Teacher < ApplicationRecord
  has_many :teacher_subjects, dependent: :destroy
  has_many :subjects, through: :teacher_subjects
  has_many :sections, dependent: :restrict_with_error

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
