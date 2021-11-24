class Room < ApplicationRecord
  belongs_to :user, optional: true
  
  has_many :reservations
  
  has_one_attached :image
  with_options presence: true do
    validates :image, blob: { content_type: ['image/jpeg', 'image/png'] }
  end
  
  
   validates :name, presence: true
   validates :introduction, presence: true
   validates :price, presence: true
   validates :address, presence: true
   validates :user_id, presence: true
   
  def self.search_area(search)
    if search
      where(['address LIKE ?', "%#{search}%"]) 
    else
      Room.all
    end
  end
  
  def self.search_key(search)
    if search
      where(['name LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%"]) 
    else
      Room.all
    end
  end
  
  

  
  
  
end
