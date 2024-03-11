class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
