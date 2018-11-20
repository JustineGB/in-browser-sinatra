class UsersController < ApplicationController
  
  get '/signup' do
    erb :'/users/signup'
  end 
  
  post "/signup" do
    @user = User.create(:username => params[:username], :password => params[:password])
		if !@user.username.empty? && @user.save  #user can only be save via bycrpt gem when a password is given
      redirect "/login"
    else 
      redirect "/failue"
	 	end
  end
  
  get '/login' do 
    erb :'/users/login'
  end
  
  post "/login" do
    @user = User.find_by(:username => params[:username])
	  if @user  && @user.authenticate(params[:password])
	  session[:user_id] = @user.id
	    redirect "/users/show"
	  else
	    redirect "/users/failure"
	  end 
	end 

  get "/users/failure" do
    erb :'/users/failure'
  end

  get "/logout" do
    session.clear
    redirect "/"
  end
  
  get '/users/show' do 
    erb :'/users/show'
  end 

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end