module SubscriberTracker
  def self.add_sub(room)
    count = sub_count(room)
    redis.set(room, count + 1)
  end

  def self.remove_sub(room)
    count = sub_count(room)
    if count == 1
      redis.del(room)
      redis.del("result_#{room}")
    else
      redis.set(room, count - 1)
    end
  end

  def self.sub_count(room)
    redis.get(room).to_i
  end

  def self.set_room_results(room_id, res)
    redis.set("result_#{room_id}", res)
  end

  def self.get_room_results(room_id)
    redis.get("result_#{room_id}")
  end

  def self.redis
    Redis.new
  end
end

