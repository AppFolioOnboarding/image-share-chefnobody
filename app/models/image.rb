class Image < ApplicationRecord
    acts_as_taggable
    validates :url, presence: true, url: true
end
