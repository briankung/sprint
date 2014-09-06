class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id])
    @events = Event.where(chapter_id: params[:id]).order(created_at: :desc)
  end
end
