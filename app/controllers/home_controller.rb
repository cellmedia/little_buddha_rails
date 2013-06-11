class HomeController < ApplicationController
  
  def index
    #create posts instance
    @posts = Post.all(:limit => 4, :order => "id DESC")
    
    #create new contact instance 
    @contact = Contact.new
  end
  
  def routing_error
    render text: "Not found, sorry", status: :not_found
  end
  
end
