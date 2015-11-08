json.user do
  json.id             @user.id
  json.name           @user.name
  json.email          @user.email
  json.image          @user.image
  json.website        @user.website
  json.note           @user.note
end