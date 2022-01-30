class Section < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :class_room
  has_many :student_sections, dependent: :destroy
  has_many :students, through: :student_sections
  has_many :available_times, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :available_times, reject_if: :all_blank, allow_destroy: true
end
