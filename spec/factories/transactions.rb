FactoryBot.define do
  factory :transaction do
    name { 'Transaction Name' }
    amount { 100 }
    association :category
    # Other attributes as needed
  end
end
