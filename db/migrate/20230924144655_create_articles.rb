class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false  # title カラムに NOT NULL 制約を追加
      t.text :content, null: false  # content カラムに NOT NULL 制約を追加
      t.string :image

      t.timestamps
    end
  end
end
