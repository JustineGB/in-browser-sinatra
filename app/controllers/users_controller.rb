class UsersController < ApplicationController
  get '/users/:id' do
    if !logged_in?
      redirect '/bags'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/bags'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/clubs'
    end
  end

  
end 
