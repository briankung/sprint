class Submission < ActiveRecord::Base
  validates :problem, presence: true,
    uniqueness: { scope: :team_id,
      message: "already exists for this team"}
  belongs_to :team
  #attr_accessible :team, :problem

  def self.boards
    [
      {
        title: 
          "<i>e</i>",
        description:
          "All problems &le; 20",
        query:
          self.
          select('team_id, SUM(problem) AS total').
          group('team_id').
          order('total DESC').
          having('MAX(problem) <= 20')
      },
      {
        title: 
          "<i>i</i>",
        description:
          "Some problems between 21 and 99",
        query:
          self.
          select('team_id, SUM(problem) AS total').
          group('team_id').
          order('total DESC').
          having('MAX(problem) BETWEEN 21 AND 99')
      },
      {
        title: 
          "&pi;",
        description:
            "Some problems &ge; 100",
        query:
          self.
          select('team_id, SUM(problem) AS total').
          group('team_id').
          order('total DESC').
          having('MAX(problem) >= 100')
          }
    ]
  end
end


