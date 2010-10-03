class Player
  include Mongoid::Document
  field :name
  field :rank
  field :goals
  field :assists
  
  embedded_in :league, :inverse_of => :players
end
