class BoatClassification < ActiveRecord::Base
  belongs_to :boat
  belongs_to :classification

  def self.sboat
    self.where("classification.name = Sailboat")
  end
end