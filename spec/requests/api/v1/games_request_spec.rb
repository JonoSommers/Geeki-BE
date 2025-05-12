require "rails_helper"

RSpec.describe "Games API", type: :request do
    before(:each) do
        @game = create(:game)
    end

    describe "Update Game Endpoint" do
        describe 'Happy Paths' do
            it "Updates the vote count for a game based." do
                patch api_v1_games_path(@game.id), as: :json

                json = JSON.parse(response.body, symbolize_names: true)

                expect(response.status).to eq(200)
                expect(json[:data][:id]).to eq(@gane.id.to_s)
                expect(json[:data][:vote_count]).to eq(@games.vote_count + 1)
            end
        end
    end
end