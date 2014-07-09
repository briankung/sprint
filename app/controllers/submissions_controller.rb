class SubmissionsController < ApplicationController
  before_action :authenticate_admin!

  def create
    team = Team.find_by_id(params[:submission][:team])
    problem = params[:submission][:problem]
    if problem.to_i >= 1
      @submission = Submission.create!({team: team, problem: problem})
    end
    redirect_to manage_event_path(team.event_id)
  end
  
  def edit
    @submission = Submission.find params[:id]
    @teams = Team.where("event_id = ?", @submission.team.event_id)
    flash[:edit] = :submission
    flash[:submission_id] = @submission.id
    redirect_to manage_event_path(@submission.team.event_id)
  end
  
  def update
    @submission = Submission.find params[:id]	
    problem = params[:submission][:problem]
    event = Event.find @submission.team.event_id
    if event.finalized
      flash[:notice] = "Event is finalized; no edits permitted."
      redirect_to events_path
    elsif problem == "" || problem == "delete"
      @submission.destroy
      redirect_to manage_event_path event
    elsif problem.to_i >= 1
      @submission.update_attributes! problem: problem
      redirect_to manage_event_path event
    else
      redirect_to manage_event_path event
    end
  end
end
