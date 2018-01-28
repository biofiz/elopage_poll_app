FactoryBot.define do
  factory :poll do
    user
    title          { FFaker::Lorem.phrase }
    answer_options { [FFaker::Lorem.word, FFaker::Lorem.word] }
  end
end