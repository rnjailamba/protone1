json.array!(@competitions) do |competition|
  json.extract! competition, :id, :name,:category, :description, :startDateText
  json.url competition_url(competition, format: :json)
end
