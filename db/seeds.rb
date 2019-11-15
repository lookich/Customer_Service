6.times do
  customer = Customer.create({
    name: Faker::Company.name,
    phone: Faker::Base.numerify('+7 (###) ### ####'),
    description: Faker::Company.catch_phrase,
    blacklist: false
    })
end
