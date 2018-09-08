class DigitChannel < ApplicationCable::Channel
  def subscribed
    SubscriberTracker.add_sub(params[:room].to_i)
    stream_from "digit:room:#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast("digit:room:#{data['room_id']}", digits)
  end

  def unsubscribed
    SubscriberTracker.remove_sub(params[:room].to_i)
  end

  private
  def digits
    res = ((1..9).to_a * 10).shuffle.sample(6)
    SubscriberTracker.set_room_results(params[:room], res.join(','))
    res
  end
end

