class ProblemsController < ApplicationController
  def show
    problem_number = params[:id]
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
