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
    candidate = params.require(:candidate).permit(:name,:provision_id,:user_id,:note,:end_date)
    candidate = Candidate.new(candidate)
    if candidate.save
      # vote yourself
      candidate_vote = CandidateVote.new(:candidate_id=>candidate.id,:user_id=>current_user.id)
      if candidate_vote.save
        redirect_to :back, :flash=>{:result=>"応募しました"}
      end
    else
      redirect_to :back, :flash=>{:result=>"応募に失敗しました"}
    end
  end

end
