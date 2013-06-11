# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  
  def index
    #create new contact instance
    @contact = Contact.new
  end
  
  def create
    #handle login using devise/warden
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in(resource_name, resource)
    
    #render success results back via json
    return render :json => {:success => true, :admin_blog => render_to_string(:layout => false, :partial => 'layouts/admin_blog'), :login_box => render_to_string(:layout => false, :partial => 'layouts/login_box')}
  end
  
  def failure
    #render failure results via json
    return render:json => {:success => false, :errors => [t("devise.failure.invalid")]}
  end
end

