class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet =Tweet.find(params[:id]) 
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user).order("created_at DESC")
  end

  def edit
    tweet = Tweet.find(params[:id])
    if user_signed_in? && current_user.id == tweet.user_id
      @tweet =Tweet.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path(params[:id])
    else
      render :edit
    end
  end



  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end


  private

  def tweet_params
    params.require(:tweet).permit(:text, :category_id).merge(user_id: current_user.id)
  end

end
