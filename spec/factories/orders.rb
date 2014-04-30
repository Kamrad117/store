# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id 1
    notes "MyText"
    price 1
    delivery_id 1
  end
end
