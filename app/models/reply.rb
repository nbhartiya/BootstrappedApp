class Reply < ActiveRecord::Base
  attr_accessible :content, :post, :user
end
