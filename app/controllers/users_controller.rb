class UsersController < ApplicationController
  
  get '/users/:id' do
    @users = User.all
    if !logged_in?
      redirect '/index'
    end
    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/index'
    end
  end
 
  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else 
      redirect to '/signup'
    end
  end 
  
  get '/login' do 
    @error_message = params[:error]
    if !session[:user_id]
      erb :'/users/login'
    else 
      redirect to '/users/show'
    end
  end 
  
  post '/signup' do 
    if params[:username] == "" || params[:password] == ""  #if username or password blank 
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/bags'
    end
  end

end 
