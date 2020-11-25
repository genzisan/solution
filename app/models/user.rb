class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :tweets
         has_many :comments

         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to :gender

         with_options presence: true do
          validates :nickname
          validates :gender_id, numericality:   { other_than: 1 }
          validates :profile
        end
end
