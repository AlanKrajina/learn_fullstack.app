class Lesson < ApplicationRecord
    belongs_to :user
    belongs_to :comment
    has_many :ratings

    accepts_nested_attributes_for :comment

    scope :search_by_title, -> (search_title){where("title = ?", search_title)}

end
