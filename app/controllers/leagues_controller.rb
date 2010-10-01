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
  
  def edit
    @league = League.find(params[:id])
  end
  
  def update
    @league = League.find(params[:id])
    if @league.update_attributes(params[:league])
      flash[:notice] = "Successfully updated #{@league.name}."
      redirect_to @league
    else
      flash[:alert] = "League update was unsuccessful."
      render :action => :edit
    end
  end
  
  def destroy
    @league = League.find(params[:id])
    flash[:notice] = "#{@league.name} successfully deleted."
    @league.destroy
    redirect_to leagues_path
  end
  
end
