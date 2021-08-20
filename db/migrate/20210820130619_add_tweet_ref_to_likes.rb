class AddTweetRefToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :tweet, foreign_key: true
  end
end
