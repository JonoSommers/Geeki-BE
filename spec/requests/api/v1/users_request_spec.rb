require "rails_helper"

RSpec.describe "Users API", type: :request do
    before(:each) do
        @user = create(:user)
    end


    describe "Show User Endpoint" do
        describe 'Happy Paths' do
            it "Finds a specific user by their ID." do
                get api_v1_user_path(@user.id), as: :json

                json = JSON.parse(response.body, symbolize_names: true)

                expect(response.status).to eq(200)
                expect(json[:data][:id]).to eq(@user.id.to_s)
                expect(json[:data][:attributes][:username]).to eq(@user.username)
            end
        end

        describe 'Sad Paths' do
            it 'Throws an error message when a user cannot be found.' do
                get api_v1_user_path(1000), as: :json

                json = JSON.parse(response.body, symbolize_names: true)

                expect(response.status).to eq(404)

                expect(json[:message]).to eq("Couldn't find User with 'id'=1000")
                expect(json[:status]).to eq(404)
            end
        end
    end

    describe "Create User Endpoint" do
        describe 'Happy Paths' do
            it 'Creates a new user.' do
                post api_v1_users_path, params: { username: "test_user" }, as: :json

                json = JSON.parse(response.body, symbolize_names: true)

                expect(response.status).to eq(200)
                expect(json[:data][:attributes][:username]).to eq("test_user")
            end
        end

        describe 'Sad Paths' do
            it 'Throws an error message if a username already exists in the database.' do
                post api_v1_users_path, params: { username: @user.username }, as: :json
                
                json = JSON.parse(response.body, symbolize_names: true)

                expect(response.status).to eq(422)
                expect(json[:message]).to eq("Validation failed: Username has already been taken")
            end

            it 'Throws an error when trying to create an account with an empty username.' do
                post api_v1_users_path, params: { username: "" }, as: :json
                
                json = JSON.parse(response.body, symbolize_names: true)

                expect(response.status).to eq(422)
                expect(json[:message]).to eq("Validation failed: Username can't be blank")
            end
        end
    end
end
