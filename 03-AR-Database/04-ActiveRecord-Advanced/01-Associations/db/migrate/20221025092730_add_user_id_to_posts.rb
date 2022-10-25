class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    # add_reference :posts, :user, foreign_key: true
    add_reference :posts, :user, index: true
    add_foreign_key :posts, :users
  end
end
