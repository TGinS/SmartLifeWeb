json.(@invitations) do |invitation|
  json.id invitation.id
  json.name invitation.name
  json.creator invitation.user_email
  json.latitude invitation.latitude
  json.longitude invitation.longitude
  json.note invitation.note
  json.contract invitation.provision
  json.end_date invitation.ended
end