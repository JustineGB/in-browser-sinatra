class UsersController < ApplicationController

	get "/signup" do
		erb :'/users/signup'
	end

	post "/signup" do
		user = User.new(:username => params[:username], :password => params[:password])
		if user.save
	   	erb :'/users/login'
	 	else
    	redirect "/users/failure"
	 	end
	end

	get "/login" do
		erb :'/users/login'
	end

	post "/login" do
	  user = User.find_by(:username => params[:username])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect "/user"
	  else
	    redirect "/users/failure"
	  end
	end

	get "/user" do
		if logged_in?
			erb :'/users/show'
		else
			redirect "/login"
		end
	end

	get "/users/failure" do
		erb :'/users/failure'
	end

	get "/logout" do
		session.clear
		redirect "/"
	end


end