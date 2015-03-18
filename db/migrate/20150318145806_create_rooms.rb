class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |x|
      x.string :name
      x.boolean :active, default: :false
      x.belongs_to :user
      x.belongs_to :player1
      x.belongs_to :player2
    end
  end
end
