class AddRetweetCountToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :Retweet_count, :integer
  end
end
