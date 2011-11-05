# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :click do
    referrer_host "twitter.com"
    referrer_path "/#"
  end
end

