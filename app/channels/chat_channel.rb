class ChatChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chat_#{params[:room]}"
  end

  def announce(hash)
    user = hash["user"] ? hash["user"] : nil
    options = { user: user, room_id: params[:room]}
    ActionCable.server.broadcast("chat_#{params[:room]}", options)
  end
end
