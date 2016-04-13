FactoryGirl.define do
  factory :admin do
    nickname "A nick"
    email "nick@email.com"
    password "123456789"
    provider "NONE"
    uid "Test"
  end

  factory :admin2 do
    nickname "A"
    email "a@email.com"
    password "qwrt63876932179"
    provider "NONE"
    uid "Test"
  end

end

