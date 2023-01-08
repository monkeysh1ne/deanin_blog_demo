class Post < ApplicationRecord
    extend FriendlyId
    validates :title, presence: true, length: { minimum:5, maximum:50 }
    validates :body, presence: true, length: { minimum:10, maximum:1000 }

    belongs_to :user
    has_many :comments, dependent: :destroy

    friendly_id :title, use: %i[slugged history]


    def should_generate_new_friendly_id?
        title_changed? || slug.blank?
    end

end
