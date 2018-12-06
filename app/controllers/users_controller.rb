class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/login' do
    redirect_if_logged_in
    erb :"/users/login"
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.username}!"
      redirect :"/users/#{@user.slug}"
    else
      flash[:error] = "Your credentials were invalid.  Please sign up or try again."
      redirect '/signup'
    end
  end

  get '/signup' do
    redirect_if_logged_in
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "You have successfully created an account!!"
      erb :'/users/show'
    else
      flash[:error] = "Account creation failure"
      redirect to '/signup'
    end
  end

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      flash[:message] = "You have been logged out. Thanks for visiting!"
      redirect to '/'
    else
      redirect to '/'
    end
  end


end
