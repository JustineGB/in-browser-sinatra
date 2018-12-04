class UsersController < ApplicationController

  get '/login' do
    redirect_if_logged_in
    erb :"/users/login"
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.username}!"
      redirect :"/users/#{@user.id}"
    else
      flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
      redirect '/signup'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect '/wines'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      flash[:errors] = "Account creation failure"
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      #redirect '/wines'
      erb :'/users/show'
    end
  end

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/:id' do
   redirect_if_not_logged_in
    @user = User.find(params[:id])
      erb :'/users/show'
  end

  post '/users/:id' do
   redirect_if_not_logged_in
    @user = User.find(params[:id])
      erb :'/users/show'
  end

get "/users/" do
  "Hello World"
end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end


end
