class Student < ApplicationRecord
  has_many :student_sections, dependent: :destroy
  has_many :sections, through: :student_sections
  has_many :booked_times, through: :sections, class_name: "AvailableTime", source: :available_times

  validates :name, :email, :roll_no, presence: true
  validates :email, :roll_no, uniqueness: true
end
