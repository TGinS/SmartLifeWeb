class ProvisionController < ApplicationController

  def index
    @provisions = Provision.joins(:user).select("provisions.*, users.name AS user_name")
  end

  def show
    @provision = Provision.joins(:user).select("provisions.*, users.name AS user_name").find(params[:id])
    @candidates = Candidate.joins(:candidate_votes).select("candidates.id, candidates.name, COUNT(candidate_votes.candidate_id) AS vote").where("provision_id = ?", params[:id]).group("candidates.id, candidates.name,candidate_votes.candidate_id")
  end

  def create
    redirect_to root_path
  end

end
