class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.belongs_to :file, index: true

      t.string    :uid, unique: true, index: true
      t.string    :text
      t.integer   :log_type, default: 1

      t.column  :created_at , :timestamp, :null => false
      t.column  :updated_at , :timestamp, :null => true
      t.column  :deleted_at , :datetime, :null => true
    end
  end
end
