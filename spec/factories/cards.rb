FactoryGirl.define do
  factory :card do
    title 'カード'
    description "MyText"
    ordinal 1
  end

  factory :card1, class: Card do
    title 'カード'
    description "MyText"
    ordinal 1
  end

  factory :card2, class: Card do
    title 'カード'
    description "MyText"
    ordinal 1
  end

  factory :card3, class: Card do
    title 'カード'
    description "MyText"
    ordinal 1
  end
end
