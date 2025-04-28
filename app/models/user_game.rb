class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  enum status: { must_play: 0, played: 1 }

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :status, inclusion: { in: statuses.keys }
end