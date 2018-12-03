class UsersController < ApplicationController

	get "/login" do
		if !logged_in?
			erb :"/users/login"
		else
			redirect '/wines'
		end
	end

	post "/login" do
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:message] = "Welcome!"
			redirect "users/#{@user.id}"
		else
			flash[:error] = "You must sign-up with a validate email and username, please."
			redirect "/"
		end
	end

	get "/signup" do
			erb :'/users/signup'
	end

	post "/users" do
		@user = User.new(username: params[:username], email: params[:email], password: params[:password])
		if @user.save
			session[:user_id] = @user.id
			flash[:message] = "You have successfully created an account! Welcome!"
				redirect "/users/#{@user.id}"
	 	else
			flash[:error] = "You must sign-up with a valid email and username, please."
    	redirect "/"
	 	end
	end

		get "/users/:id" do
			@user = User.find_by(id: params[:id])
			redirect_if_not_logged_in
			erb :'/users/show'
		end

	get "/logout" do
	    if session[:user_id] != nil
	      session.destroy
	      redirect "/users/login"
	    else
	      redirect "/"
	    end
	  end
end
