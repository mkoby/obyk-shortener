# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :short_link do
    full_link "MyString"
    short_code "MyString"
  end
end
