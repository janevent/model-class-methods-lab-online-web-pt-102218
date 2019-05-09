class Captain < ActiveRecord::Base
  has_many :boats
  has_many :classifications, through: :boats

  def self.catamaran_operators 
    self.joins(:classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    self.joins(:classifications).where(classifications: {name: "Sailboat"}).uniq 
  end

  def self.motorboat_operators
    self.joins(:classifications).where(classifications: {name: "Motorboat"}) 
  end
  def self.talented_seafarers
    #binding.pry
    ids = self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id)
    self.where(id: ids)
    
  end

  def self.non_sailors
    ids = self.sailors.pluck(:id) 
    self.where.not(id: ids)
    
  end
end
