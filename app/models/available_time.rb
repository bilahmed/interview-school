class AvailableTime < ApplicationRecord
  belongs_to :section

  validates :day, :start_time, :end_time, presence: true
  validate :end_time_must_be_after_start_time

  DAYS = %w(Monday Tuesday Wednesday Thursday Friday)

  def end_time_must_be_after_start_time
    return if start_time.blank? || end_time.blank?

    errors.add(:end_time, "must be after start time") if start_time >= end_time
  end
end
