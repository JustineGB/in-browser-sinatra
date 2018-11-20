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
  
    get '/wines/:id/edit' do 
    @wine = Wine.find(params[:id])
    erb :'/wines/show'
  end 
  
  post '/wine' do 
    Wine.create(params)
    erb :'/wines/index'
  end 
  
  post '/wines/new' do 
    Wine.create(params)
    erb :'/wines/index'
  end 
  
  post '/wine/:id' do 
    @wine = Wine.find(params[:id])
    erb :'/wines/#{@wine.id}'
  end 
  
end 