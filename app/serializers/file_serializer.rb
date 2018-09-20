class FileSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name

  def id
    object.uid
  end
end
