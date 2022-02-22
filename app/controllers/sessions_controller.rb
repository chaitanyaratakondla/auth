class SessionsController < ApplicationController

    def new

    end

    def create
        entered_email = params["email"]
        entered_password = params["password"]
        #email check
        @user = User.find_by({email: entered_email})
        #password check. If it does not match, send them back to login page (WRONG, both email and password check are in loop below)
        if @user
            if BCrypt::Password.new(@user.password) == entered_password
                session["user_id"] = @user.id
                flash[:notice] = "Welcome!"
                redirect_to "/companies"
            else
                redirect_to "/sessions/new"
                flash[:notice] = "Please check your password"
            end
        else
            redirect_to "/sessions/new"
            flash[:notice] = "Invalid email"
        end
    end

end
