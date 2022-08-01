class Blog < ApplicationRecord
    has_many :posts
    validates :name, :description, presence: true
end
