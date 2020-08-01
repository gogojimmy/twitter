class TweetsController < ApplicationController
	def index
		@tweet = Tweet.new
		@tweets = Tweet.all
	end

	def create
		@tweet = Tweet.new(permitted_params)
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
