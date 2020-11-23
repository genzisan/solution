class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '恋愛' },
    { id: 3, name: '健康' },
    { id: 4, name: '仕事' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
