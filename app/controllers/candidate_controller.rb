class CandidateController < ApplicationController

  before_action :authenticate_user!, only:[:create]

  def index
    @candidates = Candidate.joins(:user).select("candidates.*, users.name AS user_name").where("provision_id =?",params[:provision_id])
  end

  def show
    @candidate = Candidate.joins(:user, :provision).select("candidates.*, users.name AS user_name, provisions.name AS provision_name").find(params[:id])
    @users = User.joins(:candidate_votes).select("users.*, candidate_votes.created_at AS vote_time").where("candidate_votes.candidate_id = ?", params[:id])
  end


  def create
    candidate = params.require(:candidate).permit(:name,:user_id,:provision_id,:note)
    candidate = Candidate.create(candidate)
    redirect_to root_path
  end

end
