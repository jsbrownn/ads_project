class Tag < ApplicationRecord
    has_and_belongs_to_many :ad_posts
end
