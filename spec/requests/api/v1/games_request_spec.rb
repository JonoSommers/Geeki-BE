require "rails_helper"

RSpec.describe "Games API", type: :request do
    before(:each) do
        @game = create(:game)
    end

    describe "Update Game Endpoint" do
        describe 'Happy Paths' do
            it "Increased the vote count for a game if param[:direction] is up." do
                patch api_v1_game_path(@game.id), params: { direction: "up" }, as: :json

                json = JSON.parse(response.body, symbolize_names: true)

                @game.reload

                expect(response.status).to eq(200)
                expect(json[:data][:id]).to eq(@game.id.to_s)
                expect(json[:data][:attributes][:vote_count]).to eq(@game.vote_count)
            end

            it "Decreases the vote count for a game if param[:direction] is down." do
                patch api_v1_game_path(@game.id), params: { direction: "down" }, as: :json

                json = JSON.parse(response.body, symbolize_names: true)

                @game.reload

                expect(response.status).to eq(200)
                expect(json[:data][:id]).to eq(@game.id.to_s)
                expect(json[:data][:attributes][:vote_count]).to eq(@game.vote_count)
            end
        end
    end
end