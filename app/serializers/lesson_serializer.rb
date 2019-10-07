class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :comment_id
end
