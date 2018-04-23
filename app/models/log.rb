class Log < ActiveRecord::Base
  belongs_to :client, class_name: "Client"
  enum log_type: { info: 1, warning: 2, error: 3 }
  acts_as_paranoid
end
