class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end
  
  def new
    @league = League.new
  end
  
  def create
    @league = League.new(params[:league])
    if @league.save
      flash[:notice] = "#{@league.name} successfully created."
      redirect_to @league
    else
      flash[:alert] = "League was not created"
      render :action => :new
    end
  end
  
  def show
    @league = League.find(params[:id])
    @title = @league.name
  end
  
end
