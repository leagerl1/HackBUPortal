json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :repo
  json.url project_url(project, format: :json)
end
