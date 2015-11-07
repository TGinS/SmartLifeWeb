module API
  module Ver1
    class Invitation < Grape::API

      format :json
      formatter :json, Grape::Formatter::Jbuilder

      resource :invitation do

        # GET /api/ver1/invitation
        desc 'Return all invitations.'
        get '', jbuilder: 'invitation/index' do
          @invitations = ::Invitation.joins(:user, :invitation_type).select("invitations.*, users.name AS user_name, invitation_types.name AS type_name")
        end

        # GET /api/ver1/invitation/{:id}
        desc 'Return a invitation.'
        params do
          requires :id, type: Integer, desc: 'Invitation id.'
        end
        get ':id', jbuilder: 'invitation/show'  do
          @invitation = ::Invitation.joins(:user, :invitation_type).select("invitations.*, users.name AS user_name,  invitation_types.name AS type_name").find(params[:id])
          @users = ::User.joins(:invitation_votes).select("users.*, invitation_votes.created_at AS vote_time").where("invitation_votes.invitation_id = ?", params[:id])
        end

        # Post /api/ver1/invitation
        desc 'Create a Invitation.'
        params do
          requires :name,       type: String,   desc: 'Invitation name.'
          requires :type_id,    type: Integer,  desc: 'Invitation type id.'
          requires :latitude,   type: Float,    desc: 'Invitation latitude.'
          requires :longitude,  type: Float,    desc: 'Invitation longitude.'
          requires :note,       type: String,     desc: 'Invitation note.'
        end
        post '', jbuilder: 'invitation/create'  do
          authenticate_user!
          invitation = ::Invitation.create({name:               params[:name],
                                            invitation_type_id: params[:type_id],
                                            user_id:            @user.id,
                                            latitude:           params[:latitude],
                                            longitude:          params[:longitude],
                                            note:               params[:note],
                                            end_date:           nil
                                           })
          if invitation.save
            @result= "success"
          else
            @result= "Failed"
          end
        end

      end

    end
  end
end
