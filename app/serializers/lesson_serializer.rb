class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :comment_id

  belongs_to :user
  belongs_to :comment
  has_many :ratings
end
