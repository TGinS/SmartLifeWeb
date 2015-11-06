class CandidateVoteController < ApplicationController

  def create
    vote = params.require(:candidate_vote).permit(:candidate_id, :user_id)
    candidate_vote = CandidateVote.new(vote)
    if candidate_vote.save
      redirect_to :back, :flash=>{:result=>"投票しました"}
    else
      redirect_to :back, :flash=>{:result=>"投票に失敗しました"}
    end
  end

end
