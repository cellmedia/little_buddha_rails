class Contact < ActiveRecord::Base
  
  #attributes accessible
  attr_accessible :body, :email
  
  #validates email using validates_email_format_of gem
  validates :email, :email_format => {:message => 'is using an invalid format'}
  
end
