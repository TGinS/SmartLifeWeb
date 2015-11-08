json.user do
  json.id             @user.id
  json.name           @user.name
  json.named          @user.email
  json.image          @user.image
  json.website        @user.website
  json.note           @user.note
end