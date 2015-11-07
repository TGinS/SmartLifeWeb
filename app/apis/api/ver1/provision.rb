module API
  module Ver1
    class Provision < Grape::API

      format :json
      formatter :json, Grape::Formatter::Jbuilder

      resource :provision do

        # GET /api/ver1/provision
        desc 'Return all provisions.'
        get '', jbuilder: 'provision/index' do
          @provisions = ::Provision.joins(:user).select("provisions.*, users.name AS user_name")
        end

        # GET /api/ver1/provision/{:id}
        desc 'Return a provision.'
        params do
          requires :id, type: Integer, desc: 'Provision id.'
        end
        get ':id', jbuilder: 'provision/show'  do
          @provision = ::Provision.joins(:user).select("provisions.*, users.name AS user_name").find(params[:id])
          @candidates = ::Candidate.joins(:candidate_votes).select("candidates.id, candidates.name, COUNT(candidate_votes.candidate_id) AS vote").where("provision_id = ?", params[:id]).group("candidates.id, candidates.name,candidate_votes.candidate_id")
        end

        # Post /api/ver1/provision
        desc 'Create a Provision.'
        params do
          requires :name,       type: String,   desc: 'Provision name.'
          requires :latitude,   type: Float,    desc: 'Provision latitude.'
          requires :longitude,  type: Float,    desc: 'Provision longitude.'
          requires :note,       type: String,   desc: 'Provision note.'
        end
        post '', jbuilder: 'provision/create'  do
          authenticate_user!
          provision = ::Provision.create({  name:       params[:name],
                                            user_id:    @user.id,
                                            latitude:   params[:latitude],
                                            longitude:  params[:longitude],
                                            note:       params[:note],
                                            end_date:   nil
                                         })
          if provision.save
            @result= "success"
          else
            @result= "Failed"
          end
        end

      end

    end
  end
end
