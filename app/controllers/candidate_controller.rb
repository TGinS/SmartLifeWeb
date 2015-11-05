class CandidateController < ApplicationController

  def index
    @candidates = Candidate.joins(:user).select("candidates.*, users.name AS user_name").where("provision_id =?",params[:provision_id])
  end

  def show
    @candidate = Candidate.joins(:user).select("candidates.*, users.name AS user_name").find(params[:id])
  end

end
