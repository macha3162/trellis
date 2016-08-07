FactoryGirl.define do
  factory :list do
    board
    name 'リスト'
    ordinal 1
  end

  factory :list2, class: List do
    board
    name 'リスト2'
    ordinal 2
  end
end
