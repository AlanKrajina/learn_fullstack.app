class RatingSerializer < ActiveModel::Serializer
  attributes :id, :stars, :lesson_id
end
