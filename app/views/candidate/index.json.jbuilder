json.invitations @candidates do |candidate|
  json.id             candidate.id
  json.name           candidate.name
  json.provision_id   candidate.provision_id
  json.provision_url  provision_url(candidate.provision_id)
  json.user_name      candidate.user_name
  json.note           candidate.note
  json.end_date       candidate.end_date
  json.url candidate_url(candidate)
end