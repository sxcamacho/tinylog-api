class LogSerializer < ActiveModel::Serializer
  attributes :uid
  attributes :text
  attributes :date
  attributes :type

  def date
    object.created_at
  end

  def type
    object.log_type
  end
end