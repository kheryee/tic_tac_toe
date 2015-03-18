class User < ActiveRecord::Base
  has_many :rooms

  validates :username, uniqueness: true, length: { minimum: 5 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true


  private

  def self.authenticate(username_or_email, password)
    @user = User.where(email: username_or_email)[0] || User.where(username: username_or_email)[0]
    if @user && (@user.password == password)
      return @user
    else
      nil
    end
  end
end