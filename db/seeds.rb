class Seed
  def self.seed_users
    User.create(username: "Kher Yee", email: "kheryee@live.com", password: "123")
    User.create(username: "You Jing", email: "siren_wyj@hotmail.com", password: "123")
  end
end

Seed.seed_users
