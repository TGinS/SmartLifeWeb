class CandidateVoteController < ApplicationController
  def create
    p(params)
    vote = params.require(:candidate_vote).permit(:candidate_id, :user_id)
    candidate_vote = CandidateVote.new(vote)
    if candidate_vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
