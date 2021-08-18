json.extract! tweet, :id, :content, :retweet_id, :date, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
