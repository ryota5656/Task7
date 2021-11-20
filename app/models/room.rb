class Room < ApplicationRecord
  
   validates :name, presence: true
   validates :introduction, presence: true
   validates :price, presence: true
   validates :user_id, presence: true
   validates :image, presence: true
  
  
  def self.search(search) #self.はUser.を意味する
     if search
       where(['name LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
     else
       all #全て表示させる
     end
  end
  
  
  belongs_to :user, optional: true
  
  has_many :reservations
  has_many :users, through: :reservations
  
  has_one_attached :image
end
