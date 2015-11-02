RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  #config.authenticate_with do
  #  warden.authenticate! scope: :user
  #end
  #config.current_user_method(&:current_user)

  ## == Cancan ==
  #config.authorize_with :cancan

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

  config.model Invitation do
    label "募集"
    label_plural "募集"
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
        label "軽度"
      end
      field :note do
        label "メモ"
      end
      field :provision do
        label "契約先"
      end
      field :ended do
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
        label "軽度"
      end
      field :note do
        label "メモ"
      end
      field :provision do
        label "契約先"
      end
      field :ended do
        label "削除日時"
      end
    end
  end

  config.model InvitationCandidate do
    label "募集への候補"
    label_plural "募集への候補"
    list do
      field :invitation do
        label "募集"
      end
      field :provision do
        label "候補一覧"
      end
    end
    edit do
      field :invitation do
        label "募集"
      end
      field :provision do
        label "候補一覧"
      end
    end

  end

  config.model InvitationCandidateVote do
    label "募集候補への投票"
    label_plural "募集候補への投票"
    list do
      field :invitation_candidate do
        label "募集候補No."
      end
      field :user do
        label "ユーザ"
      end
    end
    edit do
      field :invitation_candidate do
        label "募集候補No."
      end
      field :user do
        label "ユーザ"
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
        label "軽度"
      end
      field :note do
        label "メモ"
      end
      field :invitation do
        label "契約先"
      end
      field :ended do
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
        label "軽度"
      end
      field :note do
        label "メモ"
      end
      field :invitation do
        label "契約先"
      end
      field :ended do
        label "削除日時"
      end
    end
  end

  config.model ProvisionCandidate do
    label "提供への候補"
    label_plural "提供への候補"
    list do
      field :provision do
        label "提供"
      end
      field :invitation do
        label "候補一覧"
      end
    end
    edit do
      field :provision do
        label "提供"
      end
      field :invitation do
        label "候補一覧"
      end
    end
  end

  config.model ProvisionCandidateVote do
    label "提供候補への投票"
    label_plural "提供候補への投票"
    list do
      field :provision_candidate do
        label "提供候補No."
      end
      field :user do
        label "ユーザ"
      end
    end
    edit do
      field :provision_candidate do
        label "提供候補No."
      end
      field :user do
        label "ユーザ"
      end
    end
  end

  config.model User do
    label "ユーザ"
    label_plural "ユーザ"
    list do
      field :email do
        label "メールアドレス"
      end
      field :password do
        label "パスワード"
      end
      field :password_confirmation do
        label "パスワード確認"
      end
      field :admin do
        label "管理者"
      end
      field :authentication_token do
        label "認証トークン"
      end
    end
    edit do
      field :email do
        label "メールアドレス"
      end
      field :password do
        label "パスワード"
      end
      field :password_confirmation do
        label "パスワード確認"
      end
      field :admin do
        label "管理者"
      end
      field :authentication_token do
        label "認証トークン"
      end
    end
  end

end
