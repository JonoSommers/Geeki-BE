class GamePlatform < ApplicationRecord
  belongs_to :game
  belongs_to :platform

  validates :game_id, presence: true
  validates :platform_id, presence: true
end
