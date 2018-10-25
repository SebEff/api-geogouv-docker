class ResultsController < ApplicationController
  def new
  end

  def create
    @result = Result.new(params[:result])

    @result.save
    redirect_to @result
  end
end
