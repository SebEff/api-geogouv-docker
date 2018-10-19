class ReportWorker
	include Sidekiq:: Worker
	
	def perform(department)
		url = URI.parse("https://geo.api.gouv.fr/departements/#{department}/communes?fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre")
 		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
			http.request(req)
		end

	end

end