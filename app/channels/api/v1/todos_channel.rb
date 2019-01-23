class Api::V1::TodosChannel < ApplicationCable::Channel
  def subscribed
    todos = Todo.find(params[:conversation])
    stream_for todos
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
