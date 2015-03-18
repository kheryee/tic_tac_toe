class CreatePlayer2s < ActiveRecord::Migration
  def change
    create_table :player2s do |x|
      x.string :name
    end
  end
end
