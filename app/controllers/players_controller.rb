class PlayersController < ApplicationController
  
  def index
    @league = League.find(params[:league_id])
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
   
   def destroy
     @league = League.find(params[:league_id])
     @player = @league.players.find(params[:player_id])
     flash[:notice] = "#{@player.name} successfully deleted."
     @player.destroy
     redirect_to league_path
   end
   
   def edit
    @league = League.find(params[:league_id])
    @player = @league.players.find(params[:id])
   end
   
   def update
     @league = League.find(params[:league_id])
     @player = @league.players.find(params[:id])
     if @player.update_attributes(params[:player])
       flash[:notice] = "Successfully updated #{@player.name}."
       redirect_to league_players_path
     else
       flash[:alert] = "Player update was unsuccessful."
       render :action => :edit
     end
   end
   
   def edit_all
     @league = League.find(params[:league_id])
   end
   
   def update_all
   end
   
end
