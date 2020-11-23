class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :text,             null: false
      t.integer :category_id,   null: false
      t.references :user,       foreign_key: true
    end
  end
end
