class DigitsController < ApplicationController
  def show
    @channel = create_channel_if_not_exist!
    @digits = [1,2,3,4,5,6]
  end

  def show_button
    channel = Channel.first

    return false if channel.blank?
    return false if channel.user_count > 2
    true
  end

  def create_channel_if_not_exist!
    Channel.find_or_create_by(channel_name: "DigitsChannel")
  end
end
