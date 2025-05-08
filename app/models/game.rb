class Game < ApplicationRecord
    has_many :reviews
    has_many :user_games
    has_many :users, through: :user_games
    has_many :game_genres
    has_many :genres, through: :game_genres
    has_many :game_platforms
    has_many :platforms, through: :game_platforms

    validates :name, presence: true
    validates :summary, presence: true
    validates :img_url, presence: true
    validates :rating, presence: true
end
