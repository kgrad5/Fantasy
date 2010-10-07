class League
  include Mongoid::Document
  field :name
  embeds_many :players
  
  accepts_nested_attributes_for :players
  validates_presence_of :name
end
