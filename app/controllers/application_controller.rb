require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be loggin in to view that page."
        redirect "/login"
      end
    end

    def redirect_if_logged_in
        if logged_in?
          flash[:message] = "You are already logged in. Welcome back!"
          redirect "/users/#{current_user.slug}"
        end
      end

    def authorized_to_edit?(wine)
      @wine.user == current_user
    end
  end

end
