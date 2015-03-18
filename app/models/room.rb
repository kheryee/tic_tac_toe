class Room < ActiveRecord::Base
  belongs_to :user
  belongs_to :player1
  belongs_to :player2
  has_one :game
end
