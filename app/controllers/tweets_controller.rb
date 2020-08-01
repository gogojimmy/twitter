class TweetsController < ApplicationController
	before_action :authenticate_user!, except: %i[index]

	def index
		@tweet = Tweet.new
		@tweets = Tweet.all
		@edit_tweet = Tweet.first
	end

	def create
		@tweet = Tweet.new(permitted_params)
		@tweet.user = current_user

		if @tweet.save
			redirect_to tweets_path
		else
			render :new
		end
	end

	private

	def permitted_params
		params.require(:tweet).permit(:body)
	end
end
