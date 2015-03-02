class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :check
      t.text :it

      t.timestamps null: false
    end
  end
end
