class ImagesController < ApplicationController
  
  def index
    #create new contact instance 
    @contact = Contact.new
  end
  
end
