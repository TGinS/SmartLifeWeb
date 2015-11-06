class InvitationVoteController < ApplicationController

  def create
    p(params)
    vote = params.require(:invitation_vote).permit(:invitation_id, :user_id)
    invitation_vote = InvitationVote.new(vote)
    if invitation_vote.save
      redirect_to :back, :flash=>{:result=>"投票しました"}
    else
      redirect_to :back, :flash=>{:result=>"投票に失敗しました"}
    end
  end

end
