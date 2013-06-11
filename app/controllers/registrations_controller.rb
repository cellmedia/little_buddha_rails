# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    #create new post instance from user params  
    @user = User.new(params[:user])
    
    #object instance attempt save, render results back via json 
    if @user.save
      return render :json => {:success => true}
    else
      return render :json => {:success => false, :errors => @user.errors.full_messages.to_sentence }
    end

  end

  def update
    super
  end
   
end

