module TinyLog
  class Log < ActiveRecord::Base
    belongs_to :file, class_name: "File"
    enum log_type: { TINY_LOG_INFO: 1, TINY_LOG_WARNING: 2, TINY_LOG_ERROR: 3 }
    acts_as_paranoid
  end
end