json.array!(@players) do |player|
  json.extract! player, :id, :name, :is_dealer
  json.url player_url(player, format: :json)
end
