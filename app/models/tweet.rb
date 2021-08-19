class Tweet < ApplicationRecord
    belongs_to :user

    validates :content, presence: true
    max_paginates_per 50
end
