class Comment < ActiveRecord::Base
  
  #active record relationships
  belongs_to :post
  belongs_to :user
  
  #attributes accessible
  attr_accessible :body, :commenter, :updated_at, :user_id
  
end
