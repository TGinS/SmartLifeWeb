json.invitation do
  json.id         @invitation.id
  json.name       @invitation.name
  json.type_name  @invitation.type_name
  json.user_name  @invitation.user_name
  json.latitude   @invitation.latitude
  json.longitude  @invitation.longitude
  json.note       @invitation.note
  json.end_date   @invitation.end_date
  json.voters @users do |voter|
    json.user_id             voter.id
    json.name           voter.name
    json.vote_time      voter.vote_time
  end
end