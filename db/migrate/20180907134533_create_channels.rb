class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.integer :user_count, default: 0
      t.string :channel_name

      t.timestamps
    end
  end
end
