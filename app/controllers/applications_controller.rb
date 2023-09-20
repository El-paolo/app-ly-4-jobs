class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: %i[ show ] 
    
    # GET /comments/1/edit
    def edit
    end
  
    # POST /comments or /comments.json
    def create
        @user = User.find(params[:application][:user_id])
        @application = Application.new(application_params)
        @application.user = current_user

      respond_to do |format|
        if @application.save
          format.html { redirect_to post_path(@post.id), notice: "Application was successfully created." }
          format.json { render :show, status: :created, location: @application }
        else
          Rails.logger.debug "Application errors: #{@application.errors.full_messages}"
          format.html { redirect_to post_path(@post.id), notice: "Application wasn't created." }
          format.json { render json: @application.errors, status: :unprocessable_entity }
        end
      end
    end
  

  

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_application
        @application = Application.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
    def application_params
        params.require(:application).permit(:content, :post_id, :user_id)
    end
  
end
