class Lesson < ApplicationRecord
    belongs_to :user
    belongs_to :comment
    has_many :ratings

    accepts_nested_attributes_for :comment

end
