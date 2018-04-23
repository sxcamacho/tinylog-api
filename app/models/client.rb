class Client < ActiveRecord::Base
  has_many :logs, class_name: "Log"
  acts_as_paranoid
end
