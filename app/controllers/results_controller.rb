class ResultsController < ApplicationController

  def index
    @results = City.all 
  end
end
