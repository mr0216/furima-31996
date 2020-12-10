FactoryBot.define do
  factory :order_address do
    postal_code { "123-4567" }
    prefecture_id { 2 }
    city {"渋谷区"}
    address { "青山1-1-1" }
    building { "柳ビル103" }
    phone_number { "09012345678" }
    user_id { 1 }
    item_id { 1 }
  end
end
