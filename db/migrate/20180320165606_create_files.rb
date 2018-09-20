class CreateFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :files do |t|
      t.string  :uid, unique: true
      t.string  :name
      t.boolean :public

      t.column  :created_at , :timestamp, :null => false
      t.column  :updated_at , :timestamp, :null => true
      t.column  :deleted_at , :datetime, :null => true
    end
  end
end
