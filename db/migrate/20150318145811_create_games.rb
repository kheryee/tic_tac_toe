class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |x|
      x.string :name
      x.belongs_to :room
    end
  end
end
