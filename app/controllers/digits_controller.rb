class DigitsController < ApplicationController
  def show
    room_result = SubscriberTracker.get_room_results(params[:id])
    @digits = room_result.present? ? room_result.split(',') : [1,2,3,4,5,6]
  end
end
