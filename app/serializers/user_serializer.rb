class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  attribute :must_play do |user|
    user.user_games
    .includes(:game)
    .status_must_play
    .map { |user_game| user_game.game.as_json }
  end

  attribute :played do |user|
    user.user_games
    .includes(:game)
    .status_played
    .map { |user_game| user_game.game.as_json }
  end
end
