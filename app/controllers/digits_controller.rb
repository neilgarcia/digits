class DigitsController < ApplicationController
  def index
  end

  def generate
    key = SecureRandom.hex[0...5]

    return redirect_to digit_path(key)
  end

  def show
    room_result = SubscriberTracker.get_room_results(params[:id])
    @digits = room_result.present? ? room_result.split(',') : [1,2,3,4,5,6]
  end
end
