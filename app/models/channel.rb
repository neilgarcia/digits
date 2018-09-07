class Channel < ApplicationRecord
  def increment!
    self.user_count += 1
    save
  end

  def decrement!
    self.user_count -= 1
    save
  end
end
