class Reply < ActiveRecord::Base
  attr_accessible :content, :post, :user
  validates_presence_of :content
  
  belongs_to :user
  belongs_to :post
end
