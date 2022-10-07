# frozen_string_literal: true

# AddFieldsToUsers
class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.string :username
      t.index :username, unique: true
    end
  end
end
