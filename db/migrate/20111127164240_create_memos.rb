class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :body

      t.timestamps
    end
  end
end
