class Game < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_one :player1
  has_one :player2
end
