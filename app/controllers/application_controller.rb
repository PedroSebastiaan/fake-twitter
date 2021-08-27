class ApplicationController < ActionController::Base
    before_action :check_status

    def check_status
        if current_user && current_user.suspended == true
            sign_out current_user 
            redirect_to new_user_session_path, notice: 'You were banned!'
        end
    end
end
