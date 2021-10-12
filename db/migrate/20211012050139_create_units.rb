class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :name
      t.text :description
      t.text :body
      t.belongs_to :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
