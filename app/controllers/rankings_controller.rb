class RankingsController < ApplicationController
  def index
    @boards = Submission.boards
    @teams = Team.all
    if params.has_key? :refresh
      if params[:refresh].to_i > 0
        @refresh = params[:refresh].to_i
      else
        @refresh = 60
      end
    end
    if params.has_key? :countdown
      require 'time'
      diff = Time.parse(params[:countdown]) - Time.now
      if diff > 0
        h_m = Time.at(diff).gmtime.strftime("%H:%M")
        @countdown = "#{h_m} remaining"
      else
        @countdown = "Time has expired!"
      end
    end
  end
end
