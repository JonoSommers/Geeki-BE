FactoryBot.define do
  factory :review do
    user { nil }
    game { nil }
    body { "MyText" }
  end
end
