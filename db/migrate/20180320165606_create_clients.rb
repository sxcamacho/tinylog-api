class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string  :user_id, index: true
      t.string  :uid, unique: true
      t.string  :title

      t.column  :created_at , :timestamp, :null => false
      t.column  :updated_at , :timestamp, :null => true
      t.column  :deleted_at , :datetime, :null => true
    end
  end
end
