module API
  module Ver1
    class CandidateVote < Grape::API

      format :json
      formatter :json, Grape::Formatter::Jbuilder

      resource :candidate_vote do

        # Post /api/ver1/candidate_vote
        desc 'Create a CandidateVote.'
        params do
          requires :candidate_id,   type: Integer,    desc: 'Candidate id.'
        end
        post '', jbuilder: 'candidate_vote/create'  do
          authenticate_user!
          candidate_vote = ::CandidateVote.create({  candidate_id:   params[:candidate_id],
                                                     user_id:        @user.id,
                                                  })
          if candidate_vote.save
            @result= "success"
          else
            @result= "Failed"
          end
        end

      end


    end
  end
end
