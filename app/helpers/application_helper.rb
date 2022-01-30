module ApplicationHelper
  def formatted_time(time)
    time.strftime("%I:%M %p")
  end
end
