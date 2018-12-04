require 'pry'

class WinesController < ApplicationController

  get "/wines" do
    redirect_if_not_logged_in
    @wines = Wine.all
    erb :"/wines/index"
  end

  get "/wines/new" do
    redirect_if_not_logged_in
    erb :"/wines/new"
  end

  post "/wines" do
   redirect_if_not_logged_in
    if params[:name] != "" && params[:vineyard] != "" && params[:rating] != "" && params[:year] != ""
      @wine = Wine.create(name: params[:name], vineyard: params[:vineyard], year: params[:year], rating: params[:rating], tasting_notes: params[:tasting_notes], user_id: current_user.id)
      flash[:message] = "Wine successfully added."
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
    @tweet.update(name: params[:name], vineyard: params[:vineyard], year: params[:year], rating: params[:rating], tasting_notes: params[:tasting_notes])
    flash[:message] = "Wine successfully added."
    redirect "/wines/#{@wine.id}"
  end

  get "/wines/:id/edit" do
    redirect_if_not_logged_in
    @wine = Wine.find(params[:id])
    if authorized_to_edit?(@tweet)
      erb :'wines/edit'
    else
      redirect '/tweets'
    end
  end

  patch "/wines/:id" do
    redirect_if_not_logged_in
    if params[:wine] == " " && !authorized_to_edit?(@wine)
      flash[:error] = "You cannot edit someone else's wine review."
      redirect "/wines/#{@wine.id}/edit"
    else
      @wine = Wine.find(params[:id])
      @wine.update(params[:wine]) #(name: params[:name], vineyard: params[:vineyard], year: params[:year], rating: params[:rating], tasting_notes: params[:tasting_notes])
      @wine.save
      flash[:message] = "Successfully edited the wine."
      redirect "/wines/#{@wine.id}"
    end
  end

  delete '/wines/:id' do
    redirect_if_not_logged_in
    @wine= Wine.find(params[:id])
    if authorized_to_edit?(@wine)
      @wine.destroy
      flash[:message] = "Successfully deleted."
      redirect '/wines'
    else
      flash[:error] = "Error. Did not delete."
      redirect '/wines'
    end
  end


end
