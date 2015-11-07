class InvitationController < ApplicationController


  def show
    @invitation = Invitation.joins(:user, :invitation_type).select("invitations.*, users.name AS user_name, invitation_types.name AS type_name").find(params[:id])
    @users = User.joins(:invitation_votes).select("users.*, invitation_votes.created_at AS vote_time").where("invitation_votes.invitation_id = ?", params[:id])
  end

  def create
    invitation = params.require(:invitation).permit(:name,:invitation_type_id,:user_id,:latitude,:longitude,:note,:end_date)
    invitation = Invitation.new(invitation)
    if invitation.save
      redirect_to :back, :flash=>{:result=>"追加しました"}
    else
      redirect_to :back, :flash=>{:result=>"追加に失敗しました"}
    end
  end

end
