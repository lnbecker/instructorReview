class Instructor < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
    accepts_nested_attributes_for :reviews
    validates :name, presence: true,
    length: { minimum: 2 } #makes sure name is at least two characters long because who goes by only one letter? (at least put a period after that single letter)
    validates :description, presence: true,
    length: { maximum: 300 }   #description should be less than 300 chars
end
