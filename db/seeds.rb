User.destroy_all

users = []
10.times do
  users << User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.user_name,
    encrypted_password:  Faker::Internet.password,
    email: Faker::Internet.email,
    address: "#{Faker::Address.city}, #{Faker::Address.country_code}",
    birth_date: Faker::Date.between(60.years.ago, Date.today),
    rank: 0,
    starting_amount: 100
  )
end
