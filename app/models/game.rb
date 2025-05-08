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
    validates :image_url, presence: true
    validates :rating, presence: true
    validates :vote_count, presence: true

    def update_vote_count(direction, game)
        case direction
        when "up"
            game.increment!(:vote_count)
        when "down"
            game.decrement!(:vote_count)
        end
    end
end
