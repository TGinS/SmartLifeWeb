module API
  module Ver1
    class InvitationVote < Grape::API

      format :json
      formatter :json, Grape::Formatter::Jbuilder

      resource :invitation_vote do

        # Post /api/ver1/invitation_vote
        desc 'Create a InvitationVote.'
        params do
          requires :invitation_id,   type: Integer,    desc: 'Invitation id.'
        end
        post '', jbuilder: 'invitation_vote/create'  do
          authenticate_user!
          invitation_vote = ::InvitationVote.create({  invitation_id:  params[:invitation_id],
                                                       user_id:        @user.id,
                                                    })
          if invitation_vote.save
            @result= "success"
          else
            @result= "Failed"
          end
        end

      end


    end
  end
end
