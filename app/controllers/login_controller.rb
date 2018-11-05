class LoginController < ApplicationController
 
    def home
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
        @allusers = User.all
    end

    def new
        @usernew = User.new
    end

    def confirm
        @usernew = User.new(first_name: params['user']['first_name'], last_name: params['user']['last_name'], email: params['user']['email'], password: params['user']['password'])
        @name_email = params['user']['email']

        if !params['user']['first_name'].present?
            redirect_to '/login/blank'
        elsif !params['user']['last_name'].present?
            redirect_to '/login/blank'
        elsif !params['user']['email'].present?
            redirect_to '/login/blank'
        elsif !params['user']['password'].present?
            redirect_to '/login/blank'
        elsif User.find_by_email(:@name_email).nil?
            redirect_to '/login/email'
        else
            @usernew.save
        end
    
    end

    def login

    end

    def check
        @current_user = User.where(email: params['/login/login']['email'], password: params['/login/login']['password']).first
        if @current_user
          session[:user_id] = @current_user.id
          redirect_to "/login/success"
        else
          session[:user_id] = nil
          redirect_to "/login/failed"
        end
    end

    def logout
        session[:user_id] = nil
    end

end
