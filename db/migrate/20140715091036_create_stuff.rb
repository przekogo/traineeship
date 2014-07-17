class CreateStuff < ActiveRecord::Migration
  def change

    create_table :posts do |t|
    t.belongs_to :user
    t.string :content
    t.timestamps
    end

    create_table :users do |t|
    t.string :name
    t.boolean :is_author
    end

    create_table :comments do |t|
    t.belongs_to :user
    t.belongs_to :post
    t.string :content
    t.timestamps

    end
  end
end
