class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string     :title, null: false
      t.text       :body,  null: false
      t.references :user,  index: true
      t.references :forum, index: true

      t.timestamps
    end
  end
end
