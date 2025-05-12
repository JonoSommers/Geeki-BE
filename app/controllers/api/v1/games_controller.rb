class Api::V1::GamesController < ApplicationController
    def update
        game = Game.find(params[:id])
        game.update_vote_count(params[:direction], game)
        render json: GameSerializer.new(game)
    end
end
