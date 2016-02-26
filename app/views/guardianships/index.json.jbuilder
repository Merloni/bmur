json.array!(@guardianships) do |guardianship|
  json.extract! guardianship, :id, :endtime
  json.url guardianship_url(guardianship, format: :json)
end
