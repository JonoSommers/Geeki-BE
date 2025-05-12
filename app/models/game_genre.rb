class GameGenre < ApplicationRecord
  belongs_to :game
  belongs_to :genre

  validates :game_id, presence: true
  validates :genre_id, presence: true
end
