# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
