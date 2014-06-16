class RankingsController < ApplicationController
  def index
    @boards = Submission.boards
    @teams = Team.all
  end
end
