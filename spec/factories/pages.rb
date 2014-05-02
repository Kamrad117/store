# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    content "MyText"
    name "MyString"
    url "MyString"
  end
end
