json.provision do
  json.id         @provision.id
  json.name       @provision.name
  json.user_name  @provision.user_name
  json.latitude   @provision.latitude
  json.longitude  @provision.longitude
  json.note       @provision.note
  json.end_date   @provision.end_date
  json.candidates @candidates.each do |candidate|
    json.id         candidate.id
    json.name       candidate.name
    json.vote       candidate.vote
    json.url        candidate_url(candidate)
  end
end