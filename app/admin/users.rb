ActiveAdmin.register User do
  config.batch_actions = false
  permit_params :name, :avatar, :email, :suspended
  actions :index, :show, :new, :create, :update, :edit

  index do
    selectable_column
    column :id 
    column :name
    column :email
    column :created_at
    column :suspended
    column "Suspend" do |u|
      button_to 'Change status', change_path(u.id), method: :patch
    end
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
