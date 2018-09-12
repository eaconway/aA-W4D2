# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  
  COLORS = [
    "black", "blue", "tuxedo"
  ]
  
  def self.colors
    COLORS.dup
  end
  
  validates :birth_date, :name, presence: true
  
  validates :color, inclusion: { in: COLORS,
   message: "not in valid colors" }
   
  validates :sex, inclusion: { in: %w(M F),
    message: "not in valid sex" }
    
  
  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
    
    
      
  def age
    now = Time.now.utc.to_date
    dob = self.birth_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
  
  
  
end
