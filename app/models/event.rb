class Event < ActiveRecord::Base
  has_many :teams
  has_many :submissions, :through => :teams

  def divisions
    divisions =
    [
      {
        title: "<i>e</i>",
        description: "All problems &le; 20",
        range: 1..20,
        teams: []
      },
      {
        title: "<i>e</i>",
        description: "Some problems between 21 and 99",
        range: 21..99,
        teams: []
      },
      {
        title: "&pi;",
        description: "Some problems &ge; 100",
        range: 100..Float::INFINITY,
        teams: []
      }
    ]
    
    teams = {}
    Team.select(:id, :name).
    where("event_id = ?", self.id).
    each do |team|
      teams[team.id] = {name: team.name, problems: []}
    end
    submissions = Submission.joins(:team).
    where("event_id = ?", self.id).
    each do |submission|
      teams[submission.team_id][:problems] << submission.problem
    end
    teams.each do |team_id, team_record|
      max = team_record[:problems].max
      team_record[:total] = team_record[:problems].sum
      divisions.each do |division|
        if division[:range].include?(max)
          division[:teams] << team_record
        end
      end
    end
    return divisions
  end
end
