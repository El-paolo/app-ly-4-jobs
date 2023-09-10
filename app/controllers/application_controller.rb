class ApplicationController < ActionController::Base
    protected
    
    def authorize_request(kind=nil)
        unless kind.include?(current_user.role)
            redirect_to posts_path, notice: "no estás autorizado para realizar esta acción"
        end
    end
end
