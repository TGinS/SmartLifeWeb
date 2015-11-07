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

      end

    end
  end
end
