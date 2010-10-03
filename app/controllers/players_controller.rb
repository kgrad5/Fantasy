class PlayersController < ApplicationController
  
  def index
   end

   def new
     @player = Player.new
   end

   def create
     @league = League.find(params[:league_id])
     @player = @league.players.create(params[:player])
     
     if @league.save
       flash[:notice] = "#{@player.name} successfully created."
       redirect_to @league
     else
       flash[:alert] = "Player was not created"
       render :action => :new
     end
   end
   
   def show
     @league = League.find(params[:league_id])
     @player = @league.players.find(params[:player_id])
   end
   
end
