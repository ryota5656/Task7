class Reservation < ApplicationRecord
  
  belongs_to :room
  belongs_to :user
  
  validates :start_data, presence: true
  validates :end_data, presence: true
  validates :people, presence: true
  validate :start_end_check
  
    def start_end_check
        if self.start_data == nil || self.end_data == nil
        elsif self.start_data < self.end_data
        else
            errors.add(:end_data, "の日付を開始日より後に設定してくだいさい。") 
        end
    end

  
end
