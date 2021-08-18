class SetDateTimeInTweets < ActiveRecord::Migration[5.2]
  def change
    def change
      change_column :tweets, :date, :datetime, default: Datetime.now
    end
  end
end
