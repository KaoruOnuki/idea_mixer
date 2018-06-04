class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :card_one
      t.string :card_two
      t.text :idea_content

      t.timestamps
    end
  end
end
