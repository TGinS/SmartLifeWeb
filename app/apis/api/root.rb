module API
  class Root < Grape::API
    # http://localhost:3000/api/
    prefix 'api'

    helpers do
      def authenticate_error!
        # 認証が失敗したときのエラー
        h = {'Access-Control-Allow-Origin' => "*",
             'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")}
        error!('You need to log in to use the app.', 401, h)
      end

      def authenticate_user!
        # header から認証に必要な情報を取得
        uid = request.headers['Uid']
        token = request.headers['Access-Token']
        @user = ::User.find_by_uid(uid)

        # 認証に失敗したらエラー
        unless @user
          authenticate_error!
        end
      end
    end

    mount API::Ver1::Root
  end
end