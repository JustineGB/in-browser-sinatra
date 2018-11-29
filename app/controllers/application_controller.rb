require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "whiteburgundy"
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be loggin in to view that page."
        redirect "/"
      end
    end

    def authorized_to_edit?(wine)
      @wine.user == current_user
    end

    def logged_in?
      !!current_user     #!!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #User.find(session[:user_id])
    end
  end

end
