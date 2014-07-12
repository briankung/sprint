class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def show
  end
end
