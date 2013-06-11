module ApplicationHelper
    
    #map user model to the devise resource
    
    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
    
    def display_date(input_date)
      return input_date.strftime("%d %b %Y | %l:%M%P |")
    end
    
end
