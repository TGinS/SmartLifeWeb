json.(@provisions) do |provision|
  json.id provision.id
  json.name provision.name
  json.creator provision.user_email
  json.latitude provision.latitude
  json.longitude provision.longitude
  json.note provision.note
  json.contract provision.invitation
  json.end_date provision.ended
  json.url provision_url(provision)
end