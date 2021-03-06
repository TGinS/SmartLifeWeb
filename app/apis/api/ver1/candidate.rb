module API
  module Ver1
    class Candidate < Grape::API

      format :json
      formatter :json, Grape::Formatter::Jbuilder

      resource :provision do
        route_param :provision_id do
          resource :candidate do

          # GET /api/ver1/candidate
          desc 'Return all candidates depends on specific provision.'
          params do
            requires :provision_id, type: Integer, desc: 'provision id.'
          end
          get '', jbuilder: 'candidate/index' do
            @candidates = ::Candidate.joins(:user).select("candidates.*, users.name AS user_name").where("provision_id =?",params[:provision_id])
          end

          end
        end
      end

      resource :candidate do

        # GET /api/ver1/candidate/{:id}
        desc 'Return a candidate.'
        params do
          requires :id, type: Integer, desc: 'candidate id.'
        end
        get ':id', jbuilder: 'candidate/show'  do
          @candidate = ::Candidate.joins(:user, :provision).select("candidates.*, users.name AS user_name, provisions.name AS provision_name").find(params[:id])
          @users = ::User.joins(:candidate_votes).select("users.*, candidate_votes.created_at AS vote_time").where("candidate_votes.candidate_id = ?", params[:id])
        end

        # Post /api/ver1/candidate
        desc 'Create a Candidate.'
        params do
          requires :name,           type: String,   desc: 'Candidate name.'
          requires :provision_id,   type: Integer,    desc: 'Provision id. Parent of candidate.'
          requires :note,           type: String,   desc: 'Candidate note.'
        end
        post '', jbuilder: 'candidate/create'  do
          authenticate_user!
          candidate = ::Candidate.create({  name:         params[:name],
                                            provision_id: params[:provision_id],
                                            user_id:      @user.id,
                                            note:         params[:note],
                                            end_date:     nil
                                         })
          if candidate.save
            # vote yourself
            candidate_vote = ::CandidateVote.create(:candidate_id=>candidate.id,:user_id=>@user.id)
            if candidate_vote.save
              @result= "success"
            end
          else
            @result= "Failed"
          end
        end

      end

    end
  end
end