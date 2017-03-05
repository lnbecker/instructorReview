class Review < ActiveRecord::Base
  belongs_to :instructor
    validates :rating, presence: true, :inclusion => 1..10
    validates :comment, presence: true,
    length: { maximum: 300 }
end
