class AddUserToCards < ActiveRecord::Migration[5.1]
  def change
    add_reference :cards, :user, index: true, foreign_key: true
  end
end
