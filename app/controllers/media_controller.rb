class MediaController < ApplicationController
  
  def index
    #create new contact instance 
    @contact = Contact.new
  end
  
end
