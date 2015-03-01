json.array!(@tracks) do |track|
  json.extract! track, :id, :title, :description, :genre_id, :user_id
  json.url track_url(track, format: :json)
end
