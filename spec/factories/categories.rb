FactoryBot.define do
  factory :category do
    name {Faker::Name.name}
    state {Faker::Address.state}
    vertical
  end
end