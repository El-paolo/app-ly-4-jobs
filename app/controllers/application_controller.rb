class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
    end
    
    
    def authorize_request(kind=nil)
        unless kind.include?(current_user.role.to_s)
            redirect_to posts_path, notice: "no estás autorizado para realizar esta acción"
        end
    end
end
