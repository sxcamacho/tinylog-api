class LogSerializer < ActiveModel::Serializer
  attributes :id
  attributes :text
  attributes :date
  attributes :type

  def id
    object.uid
  end

  def date
    object.created_at
  end

  def type
    object.log_type
  end
end