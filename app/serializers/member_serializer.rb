class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :status, :assigned, :bio
end
