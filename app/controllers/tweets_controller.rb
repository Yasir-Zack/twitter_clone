# frozen_string_literal: true

# tweets Controller
class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @tweets = Tweet.all.order(created_at: :DESC)
    @tweet = Tweet.new
  end

  def new
    @tweet = current_user.tweet.build
  end

  def show; end

  def edit; end

  def create
    @tweet = current_user.tweet.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated' }
        format.json { render :show, status: :ok,  location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to @tweet, notice: 'Tweet was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end
end
