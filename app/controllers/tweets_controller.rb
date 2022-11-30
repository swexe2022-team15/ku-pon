class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show]
  def show
    @current_user=corporates_url.id
  end
  
  private
  def set_tweet
  end
end
