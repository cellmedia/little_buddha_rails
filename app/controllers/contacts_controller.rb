class ContactsController < ApplicationController

  def new
    #create new contact instance 
    @contact = Contact.new
  end
  
  def create
    #object instance attempt save, send results back via json 
    @contact = Contact.new(params[:contact]) 
    
    if @contact.save
      return render :json => {:success => true}
    else
      return render :json => {:success => false, :errors => @contact.errors.full_messages.to_sentence }
    end
  end
  
end


