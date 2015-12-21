class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.boolean :is_girl, null: false
      t.boolean :is_special, null: false, default: :false

      t.timestamps null: false
    end
  end
end
