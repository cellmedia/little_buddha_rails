class NewsController < ApplicationController
  
  def index
    #create post instance with will_paginate plugin applied 
    @posts = Post.paginate(:page => params[:page], :order => "created_at DESC")
    
    #create post instance grouped into each month
    @category_by_month = Post.all.group_by { |post| post.created_at.strftime("%B") }
    
    #create new contact instance 
    @contact = Contact.new
  end
  
end
