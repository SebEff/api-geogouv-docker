class ReportWorker
	include Sidekiq:: Worker
	sidekiq_options retry: false

	def perform(department)
		puts "Valeur du département #{department}"
	end

end