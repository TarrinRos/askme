class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show]

  # GET /hashtags/:name
  def show
    @questions = @hashtag.questions
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashtag
      @hashtag = Hashtag.find_by(name: params[:name])
    end
end
