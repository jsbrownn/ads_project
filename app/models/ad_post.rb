class AdPost < ApplicationRecord
    has_and_belongs_to_many :tags
    accepts_nested_attributes_for :tags
    has_many_attached :images
   
end

