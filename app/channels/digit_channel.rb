class DigitChannel < ApplicationCable::Channel
  def subscribed
    channel.increment!
    stream_from "digit:room:#{params[:room]}"
  end

  def receive(data)
    rand = (1..9).to_a.sample(6).shuffle
    ActionCable.server.broadcast("digit:room:#{data['room_id']}", rand)
  end

  def unsubscribed
    channel.decrement!
  end

  private

  def channel
    Channel.first
  end
end

