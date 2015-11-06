class ProvisionController < ApplicationController

  def index
    @provisions = Provision.joins(:user).select("provisions.*, users.name AS user_name")
  end

  def show
    @provision = Provision.joins(:user).select("provisions.*, users.name AS user_name").find(params[:id])
    @candidates = Candidate.joins(:candidate_votes).select("candidates.id, candidates.name, COUNT(candidate_votes.candidate_id) AS vote").where("provision_id = ?", params[:id]).group("candidates.id, candidates.name,candidate_votes.candidate_id")
  end

  def create
    provision = params.require(:provision).permit(:name,:user_id,:latitude,:longitude,:note,:end_date)
    provision = Provision.new(provision)
    if provision.save
      redirect_to :back, :flash=>{:result=>"追加しました"}
    else
      redirect_to :back, :flash=>{:result=>"追加に失敗しました"}
    end
  end

end
