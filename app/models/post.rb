class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  validates_presence_of :title, :content, :user_id => true
  
  belongs_to :user
end
