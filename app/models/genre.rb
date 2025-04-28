class Genre < ApplicationRecord
    has_many :game_genres
    has_many :games, through: :game_genres

    validates :name, presence: true, uniqueness: true
end
