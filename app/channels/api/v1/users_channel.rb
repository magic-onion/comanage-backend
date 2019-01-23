class Api::V1::UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "todos_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
