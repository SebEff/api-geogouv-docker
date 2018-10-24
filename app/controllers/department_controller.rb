class DepartmentController < ApplicationController

	def new
	end

	def create
		department = params[:department]
		ReportWorker.perform_async(department)
	end
  
end