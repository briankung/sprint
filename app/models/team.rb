class Team < ActiveRecord::Base
  validates :event_id, presence: true
  belongs_to :event
  has_many :submissions, dependent: :destroy

  def problems_solved
    Submission.where(team_id: self).order(:problem).pluck(:problem)
  end
end
