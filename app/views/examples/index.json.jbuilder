json.array!(@examples) do |example|
  json.extract! example, :id, :check, :it
  json.url example_url(example, format: :json)
end
