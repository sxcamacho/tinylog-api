module TinyLog
  class Log < ActiveRecord::Base
    belongs_to :file, class_name: "File"
    enum log_type: { info: 1, warning: 2, error: 3 }
    acts_as_paranoid
  end
end