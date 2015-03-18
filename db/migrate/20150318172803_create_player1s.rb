class CreatePlayer1s < ActiveRecord::Migration
  def change
    create_table :player1s do |x|
      x.string :name
    end
  end
end
