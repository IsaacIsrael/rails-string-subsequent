FactoryBot.define do
  factory :calculation do
    string_a 'abcdefg'
    string_b 'beg'
    result true
    substrings [1,4,6]
    user
  end
end
