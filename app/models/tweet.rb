class Tweet < ApplicationRecord
  has_many :comments
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :text
    validates :category_id, numericality: { other_than: 1 }
  end

end
