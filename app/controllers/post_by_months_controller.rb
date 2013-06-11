class PostByMonthsController < ApplicationController
  
  def index
    #parameter passed from month picked from categories in the news view
    month = params[:month]
    
    #create post instance grouped into each month
    @category_by_month = Post.all.group_by { |post| post.created_at.strftime("%B") }
    
    #create post instance based on month picked parameter, with will_paginate plugin applied 
    @posts_by_month = Post.paginate(:page => params[:page], :order => "created_at DESC", :conditions => ["MONTH(created_at) = ?", Date::MONTHNAMES.index(month)])
    
    #create new contact instance 
    @contact = Contact.new
  end

end
