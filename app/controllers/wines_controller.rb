class WinesController < ApplicationController
 
  get '/wines' do 
    @wines = Wine.all
    erb :'/wines/index'
  end 

  get '/wines/new' do
    erb :'/wines/new'
  end

  get '/wines/:id' do
    @wine = Wine.find(params[:id])
    erb :'/wines/show'
  end

  post '/wines' do
    @wine = Wine.create(params[:wine])
    redirect to "wines/#{@wine.id}"
  end
  
  get '/wines/:id/edit' do
    @wine= Wine.find(params[:id])
    erb :'/wines/edit'
  end

end 