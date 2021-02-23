ActiveAdmin.register User do
  index do
    column :id
    column :email
    column :name
    column :created_at
    column :update_at
    column :image_url
    column :likes
    column :retweets  #Acomodar los retweets
    column :friends_id  #Hacer la hisotoria 1
    actions defaults: true
  end
end
