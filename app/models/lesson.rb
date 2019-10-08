class Lesson < ApplicationRecord
    belongs_to :user
    belongs_to :comment
    has_many :ratings

    accepts_nested_attributes_for :comment

    validate :title_content

    scope :search_by_title, -> (search_title){where("title = ?", search_title)}


    def title_content
        if [self.title, self.content].reject(&:blank?).size == 0
          errors[:base] << ("Please submit title and content.")
        end
    end  

end
