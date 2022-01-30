class ClassRoom < ApplicationRecord
  has_many :sections, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
