class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :course_id
      t.text :description
      t.integer :user_id
      t.string :embed_url
      t.datetime :publish_date
      t.timestamps
    end
  end
end
