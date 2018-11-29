class UsersController < ApplicationController

	get "/login" do
		if !logged_in?
			erb :"/users/login"
		else
			redirect '/users/show'
		end
	end

	post "/login" do
		@user = User.find_by(:username => params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:message] = 'Welcome!'
			redirect "users/#{@user.id}"
		else
			flash[:error] = "You must sign-up with a validate email and username, please."
			redirect "/users/login"
		end
	end

	get "/signup" do
		#if !logged_in?
			erb :'/users/signup'
		#else
		#	redirect "users/#{@user.id}"
		#end
	end

	post "/signup" do
		@user = User.new(:username => params[:username], :password => params[:password])
		if @user.save
			session[:user_id] = @user.id
	   	erb :'/users/show'
	 	else
			flash[:error] = "You must sign-up with a validate email and username, please."
    	redirect "/"
	 	end
	end

	get "/users/:id" do
		redirect_if_not_logged_in
		@user = User.find(params[:id])
		erb :'/users/show'
	end

	get "/logout" do
	    if session[:user_id] != nil
	      session.destroy
	      redirect "/"
	    else
	      redirect "/"
	    end
	  end
end
