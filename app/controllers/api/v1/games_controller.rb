class Api::V1::GamesController < ApplicationController
    def update
        game = Game.find(params[:id])
        direction = params.require(:direction)
        game.update_vote_count(direction, game)
        render json: GameSerializer.new(game)
    end
end
