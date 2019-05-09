class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all 
    self.all
  end

  def self.longest
    #binding.pry
    l = Boat.order('length desc').first.length
    self.joins(:boats).where(boats: {length: l}) 
    
  end
end
