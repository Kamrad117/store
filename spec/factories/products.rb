# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyText"
    price 1
    category_id 1
    brand_id 1
  end
end
