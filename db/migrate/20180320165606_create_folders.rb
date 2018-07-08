class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.string  :uid, unique: true
      t.string  :title

      t.column  :created_at , :timestamp, :null => false
      t.column  :updated_at , :timestamp, :null => true
      t.column  :deleted_at , :datetime, :null => true
    end
  end
end
