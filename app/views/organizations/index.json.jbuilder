json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :ban
  json.url organization_url(organization, format: :json)
end
