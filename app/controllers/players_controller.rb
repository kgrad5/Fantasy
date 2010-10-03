class PlayersController < ApplicationController
  def index
  end
  
  def new
    @league = League.find(params[:league_id])
  end
  
  def create
    @league = League.find(params[:id])
    @league.players.create(Player.new(params[:player]))
    if @league.save
      flash[:notice] = "#{@player.name} successfully created."
      redirect_to @league
    else
      flash[:alert] = "Player was not created"
      render :action => :new
    end
  end
end
