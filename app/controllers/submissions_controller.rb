class SubmissionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find params[:id]
    redirect_to edit_submission_path @submission
  end

  def create
    team = Team.find_by_id(params[:submission][:team])
    problem = params[:submission][:problem]
    @submission = Submission.create!({team: team, problem: problem})
    if URI(request.referer).path == new_submission_path
      redirect_to new_submission_path
    else
      redirect_to manage_event_path(team.event_id)
    end
  end
  
  def edit
    @submission = Submission.find params[:id]
  end
  
  def update
    @submission = Submission.find params[:id]	
    before = "#{@submission.team.name} / #{@submission.problem}"
    team = Team.find_by_id(params[:submission][:team])
    problem = params[:submission][:problem]
    @submission.update_attributes!({team: team, problem: problem})
    after = "#{@submission.team.name} / #{@submission.problem}"
    flash[:notice] = "Was #{before}; now #{after}."
    redirect_to edit_submission_path @submission
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    name = @submission.team.name
    event_id = @submission.team.event_id
    problem = @submission.problem
    if @submission.destroy
      flash[:notice] = "Submission #{name}/#{problem} has been deleted."
    else
      flash[:notice] = "Submission #{name}/#{problem} WAS NOT DELETED!"
    end
    redirect_to manage_event_path(event_id)
  end
end
