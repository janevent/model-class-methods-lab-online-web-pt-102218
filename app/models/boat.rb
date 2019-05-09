class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five 
    self.limit(5)
  end

  def self.dinghy
    self.where("length < 20")
  end

  def self.ship 
    self.where("length >= 20")
  end

  def self.last_three_alphabetically 
    self.order("name DESC").limit(3)
    #binding.pry 
  end

  def self.without_a_captain
    #binding.pry
    self.where(captain_id: nil)
  end

  def self.sailboats 
    #binding.pry
    self.joins(:classifications).where(classifications: {name: "Sailboat"} )
    
  end

  def self.with_three_classifications 
    #binding.pry
    boat_keys = Classification.joins(:boats).group(:boat_id).count(:boat_id).select {|k,v| v == 3}
    k = boat_keys.keys
    self.where(id: k)
  end

  
end
