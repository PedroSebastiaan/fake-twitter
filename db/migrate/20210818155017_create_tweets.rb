class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.integer :retweet_id
      t.datetime :date

      t.timestamps
    end
  end
end
