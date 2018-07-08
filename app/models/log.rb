class Log < ActiveRecord::Base
  belongs_to :folder, class_name: "Folder"
  enum log_type: { info: 1, warning: 2, error: 3 }
  acts_as_paranoid
end
