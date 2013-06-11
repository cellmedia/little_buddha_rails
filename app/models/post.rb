class Post < ActiveRecord::Base
  
  #attributes accessible
  attr_accessible :content, :name, :title, :updated_at
  
  #active record relationships
  has_many :comments, :dependent => :destroy
  
  #model attribute validations
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  
  #will_paginate plugin setting
  self.per_page = 4                  
  
end
