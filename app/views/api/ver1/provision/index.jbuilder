json.provisions @provisions do |provision|
  json.id         provision.id
  json.name       provision.name
  json.user_name  provision.user_name
  json.latitude   provision.latitude
  json.longitude  provision.longitude
  json.note       provision.note
  json.end_date   provision.end_date
end