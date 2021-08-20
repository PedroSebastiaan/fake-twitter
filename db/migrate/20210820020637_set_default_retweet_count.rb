class SetDefaultRetweetCount < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :retweet_count, :integer, :default => 0
  end
end
