class Player
  include Mongoid::Document
  field :name
  field :rank
  field :goals, :type => Fixnum, :default => 0
  field :assists, :type => Fixnum, :default => 0
  
  embedded_in :league, :inverse_of => :players
end
