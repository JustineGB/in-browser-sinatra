require 'pry'

class WinesController < ApplicationController

  get "/wines" do
    redirect_if_not_logged_in
    @wines = Wine.all
    erb :'/wines/index'
  end

  get "/wines/new" do
    redirect_if_not_logged_in
    erb :'/wines/new'
  end

  post "/wines" do
    redirect_if_not_logged_in
    #if params[:wine] != ""
    if params[:name] != "" && params[:vineyard] != "" && params[:rating] != "" && params[:year] != ""
      @wine = Wine.create(name: params[:name], vineyard: params[:vineyard], year: params[:year], rating: params[:rating], tasting_notes: params[:tasting_notes], user_id: current_user.id)
      #@wine = Wine.create(params)
      flash[:message] = "Wine successfully added."
      #redirect "/wines"
      redirect "/wines/#{@wine.id}"
    else
      flash[:errors] = "Something went wrong - you must fill in all of the required fields for your entry."
      redirect '/wines/new'
    end
  end

  get "/wines/:id" do
    redirect_if_not_logged_in
    @wine = Wine.find(params[:id])
    erb :'/wines/show'
  end

  post "/wines/:id" do
    redirect_if_not_logged_in
    @wine = Wine.find(params[:id])
  # @wine.update(params[:wine])
   redirect "/wines/#{@wine.id}"
  end


end
