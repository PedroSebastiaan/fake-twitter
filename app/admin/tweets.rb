ActiveAdmin.register Tweet do
  config.batch_actions = false
  permit_params :id, :content, :retweet_id, :retweet_count, :created_at, :updated_at, :user_id

  index do
    selectable_column
    column :id 
    column :content
    column :retweet_id
    column :created_at
    column :updated_at
    column "Retweets" do |u|
      Tweet.where(retweet_id: u.id).count
    end
    column "User" do |u|
      User.find(u.user_id).name
    end
    column "likes" do |u|
      Like.where(:tweet_id => u.id).count
    end
    actions
    
  end
  
end
