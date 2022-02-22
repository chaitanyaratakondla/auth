class ApplicationController < ActionController::Base
    before_action :current_user
    # means before any other action in application is run, this is going to be run

    def current_user
        #checkiung to see there is a session ID
        if session["user_id"]
            @current_user = User.find(session["user_id"])
        end
    end

end
