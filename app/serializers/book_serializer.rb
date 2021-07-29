class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :updated_at
  belongs_to :category
  belongs_to :user
end
