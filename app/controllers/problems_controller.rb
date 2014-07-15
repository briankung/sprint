class ProblemsController < ApplicationController
  def index
    relation = ActiveRecord::Base.connection.execute "SELECT number, name, event_id, event, team FROM problems LEFT JOIN (SELECT events.id AS event_id, events.name AS event, teams.name AS team, submissions.problem AS problem FROM events LEFT JOIN teams ON events.id = teams.event_id LEFT JOIN submissions ON teams.id = submissions.team_id) AS ets ON problems.number = ets.problem ORDER BY number;"
    @solved = {}
    relation.each do |tuple|
      if @solved[tuple['number']].nil?
        @solved[tuple['number']] = {name: tuple['name'], solvers: []}
      end
      if tuple['event']
        @solved[tuple['number']][:solvers] << tuple
      end
    end
  end

  def show
    problem_number = params[:number]
    candidate_solution = params[:solution]
    unless problem_number.nil? or candidate_solution.nil?
      check = Problem.check(problem_number, candidate_solution)
      case check
      when true
        @message = "#{candidate_solution} is the correct answer to problem #{problem_number}."
        @correctness = "correct"
      when false
        @message = "#{candidate_solution} is not the correct answer to problem #{problem_number}."
        @correctness = "incorrect"
      when nil
        @message = "No solution known or invalid problem number (T_T)"
        @correctness = "incorrect"
      end
    end
  end
end
