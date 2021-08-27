ActiveAdmin.register User do

  index do
    selectable_column
    column :id 
    column :name
    column :email
    column :created_at
    column "tweets" do |u|
      Tweet.where(user_id: u.id, retweet_id: nil).count
    end
    column "retweets" do |u|
      (Tweet.where(user_id: u.id)).where.not(retweet_id: nil).count
    end
    column "likes" do |u|
      Like.where(user_id: u.id).count
    end
    actions
  end
  
end
