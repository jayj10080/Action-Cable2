class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # Saves message to the db
    Message.create! content: data['message']

    ActionCable.server.broadcast 'room_channel', data['message']
  end
end
