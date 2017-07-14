class Seed

  def self.begin
    seed = Seed.new
    seed.generate_products
    seed.generate_users
  end

  def generate_products
    Product.destroy_all
    20.times do |i|
      Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop)
    end
    p "Created #{Product.count} products"
  end

  def generate_users
    User.destroy_all
    admin = User.create(name: "Admin", email: "admin@email.com", password: "password", password_confirmation: "password")
    admin.update_attribute :admin, true
    user = User.create(name: "User", email: "user@email.com", password: "password", password_confirmation: "password")
    p "Created #{User.count} users"
  end

end

Seed.begin
