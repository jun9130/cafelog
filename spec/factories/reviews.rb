FactoryBot.define do
  factory :review do
    text    {"このお店はとても良い"}
    user_id {"1"}
    shop_id {"1"}
    user
    shop
  end
end
