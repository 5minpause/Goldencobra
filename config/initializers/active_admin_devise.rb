ApplicationController.class_eval do  
    layout :layout_by_resource 

    
    def current_ability
        @current_ability ||= Ability.new(current_user)
    end
    
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to admin_dashboard_path, :alert => exception.message
    end

    protected
    def layout_by_resource 
      if devise_controller?
        "goldencobra/active_admin_esque" # we emulate the active_admin layout for consistancy 
      else 
        "application" 
      end 
    end
end