# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @tweets = Tweet.all.order('created_at DESC')
    @tweet = Tweet.new
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render 'edit'

    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end

  def correct_user
   @tweet = current_user.tweets.find_by(id: params[:id])
    redirect_to tweets_path, notice: 'Not Authorized' if @tweet.nil?
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twit)
  end
end
