module API
  module Ver1
    class Root < Grape::API
      # http://localhost:3000/api/ver1/
      version 'ver1'
      format :json

      mount API::Ver1::Account
      mount API::Ver1::Provision
      mount API::Ver1::Invitation
      mount API::Ver1::InvitationVote
      mount API::Ver1::Candidate
      mount API::Ver1::CandidateVote
    end
  end
end