json.candidate do
  json.id             @candidate.id
  json.name           @candidate.name
  json.provision_id   @candidate.provision_id
  json.user_name      @candidate.user_name
  json.note           @candidate.note
  json.end_date       @candidate.end_date
  json.voters @users do |voter|
    json.user_id             voter.id
    json.name           voter.name
    json.vote_time      voter.vote_time
  end
end