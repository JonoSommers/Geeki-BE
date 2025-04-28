require "rails_helper"

RSpec.describe "Users API", type: :request do
    before(:each) do
        @user = create(:user)
    end

    describe "Show User Endpoint" do
        it "Finds a specific user by their ID." do
            get api_v1_user_path(@user.id), as: :json

            json = JSON.parse(response.body, symbolize_names: true)

            expect(response.status).to eq(200)
            expect(json[:data][:id]).to eq(@user.id.to_s)
            expect(json[:data][:attributes][:username]).to eq(@user.username)
        end
    end
end
