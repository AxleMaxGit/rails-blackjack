json.array!(@examples) do |example|
  json.extract! example, :id, :name, :cost
  json.url example_url(example, format: :json)
end
