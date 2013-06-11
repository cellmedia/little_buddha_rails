class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path, :flash => {:notice => "Insufficient rights!" }) : (redirect_to(root_path, :flash => {:notice => "Insufficient rights!" }) unless current_user.admin?)
  end
end
