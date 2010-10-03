class League
  include Mongoid::Document
  field :name
  embeds_many :players
  
  validates_presence_of :name
end
