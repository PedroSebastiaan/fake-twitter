module Api
    module V1
        class NewsController < V1Controller
            def last_tweets
                @tweets = Tweet.last(50)
                last_tweets = @tweets.map do |tweet|
                    id =  tweet.id,
                    content = tweet.content,
                    user_id = tweet.user_id,
                    like_count = Like.where(tweet_id: tweet.id).count,
                    retweet_count = Tweet.where(retweet_id: tweet.id).count,
                    retweeted_from = tweet.retweet_id
                end
                render json: last_tweets
            end
        end
    end
end