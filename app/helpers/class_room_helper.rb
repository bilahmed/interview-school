module ClassRoomHelper
  def class_room_options
    ClassRoom.pluck(:name, :id)
  end
end
