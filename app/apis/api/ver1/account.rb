module API
  module Ver1
    class Account < Grape::API

      format :json
      formatter :json, Grape::Formatter::Jbuilder

      resource :account do

        # GET /api/ver1/account
        desc 'Return user info.'
        get '', jbuilder: 'account/index' do
          authenticate_user!
        end

      end

    end
  end
end