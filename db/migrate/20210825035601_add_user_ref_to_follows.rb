class AddUserRefToFollows < ActiveRecord::Migration[5.2]
  def change
    add_reference :follows, :user, foreign_key: true
  end
end
