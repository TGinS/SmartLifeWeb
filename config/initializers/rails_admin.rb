RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model User do
    label "ユーザ"
    label_plural "ユーザ"
    list do
      field :id do
        label "id"
      end
      field :uid do
        label "ユーザID"
      end
      field :provider do
        label "登録サービス"
      end
      field :name do
        label ""
      end
      field :email do
        label "メールアドレス"
      end
      field :image do
        label "画像"
      end
      field :website do
        label "website"
      end
      field :admin do
        label "admin"
      end
      field :password do
        label "password"
      end
      field :note do
        label "詳細"
      end
      field :tokens do
        label "token"
      end
    end
    edit do
      field :name do
        label ""
      end
      field :email do
        label "メールアドレス"
      end
      field :image do
        label "画像"
      end
      field :website do
        label "website"
      end
      field :admin do
        label "admin"
      end
      field :password do
        label "password"
      end
      field :password_confirmation do
        label "password確認"
      end
      field :note do
        label "詳細"
      end
    end
  end

  config.model Invitation do
    label "募集"
    label_plural "募集"
    list do
      field :name do
        label "名前"
      end
      field :invitation_type do
        label "募集の種類"
      end
      field :user do
        label "作成者"
      end
      field :latitude do
        label "緯度"
      end
      field :longitude do
        label "経度"
      end
      field :note do
        label "メモ"
      end
      field :end_date do
        label "削除日時"
      end
    end
    edit do
      field :name do
        label "名前"
      end
      field :invitation_type do
        label "募集の種類"
      end
      field :user do
        label "作成者"
      end
      field :latitude do
        label "緯度"
      end
      field :longitude do
        label "経度"
      end
      field :note do
        label "メモ"
      end
      field :end_date do
        label "削除日時"
      end
    end
  end

  config.model Provision do
    label "提供"
    label_plural "提供"
    list do
      field :name do
        label "名前"
      end
      field :user do
        label "作成者"
      end
      field :latitude do
        label "緯度"
      end
      field :longitude do
        label "経度"
      end
      field :note do
        label "メモ"
      end
      field :end_date do
        label "削除日時"
      end
    end
    edit do
      field :name do
        label "名前"
      end
      field :user do
        label "作成者"
      end
      field :latitude do
        label "緯度"
      end
      field :longitude do
        label "経度"
      end
      field :note do
        label "メモ"
      end
      field :end_date do
        label "削除日時"
      end
    end
  end

  config.model InvitationType do
    label "募集の種類"
    label_plural "募集の種類"
    list do
      field :name do
        label "種類"
      end
    end
      edit do
        field :name do
          label "種類"
        end
    end
  end

  config.model InvitationVote do
    label "募集への投票"
    label_plural "募集への投票"
    list do
      field :invitation do
        label "募集"
      end
      field :user do
        label "ユーザ"
      end
    end
      edit do
        field :invitation do
          label "募集"
        end
      field :user do
        label "ユーザ"
      end
    end
  end

  config.model Candidate do
    label "候補"
    label_plural "候補"
    list do
      field :name do
        label "名前"
      end
      field :provision do
        label "応募先"
      end
      field :user do
        label "作成者"
      end
      field :note do
        label "メモ"
      end
      field :end_date do
        label "削除日時"
      end
    end
    edit do
      field :name do
        label "名前"
      end
      field :provision do
        label "応募先"
      end
      field :user do
        label "作成者"
      end
      field :note do
        label "メモ"
      end
      field :end_date do
        label "削除日時"
      end
    end
  end

  config.model CandidateVote do
    label "候補への投票"
    label_plural "候補への投票"
    list do
      field :candidate do
        label "候補"
      end
      field :user do
        label "ユーザ"
      end
    end
    edit do
      field :candidate do
        label "候補"
      end
      field :user do
        label "ユーザ"
      end
    end
  end


end
