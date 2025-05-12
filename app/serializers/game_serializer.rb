class GameSerializer
  include JSONAPI::Serializer
  attributes :name, :summary, :release_date, :rating, :developer, :theme, :franchises, :img_url, :vote_count
end
