json.array!(@events) do |event|
  json.extract! event, :id, :name, :finalized
  json.url event_url(event, format: :json)
end
