class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes

    validates :content, presence: true
    max_paginates_per 50
end
