FactoryBot.define do
  factory :course do
    name {Faker::Name.name}
    author {Faker::Book.author}
    state {Faker::Address.state}
  end
end