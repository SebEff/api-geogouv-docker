class ReportWorker
	include Sidekiq:: Worker
	
	def perform(department)
		url = URI.parse("https://geo.api.gouv.fr/departements/#{department}/communes?fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre")
		 response = Net::HTTP.get(url)
		 reponse_hash = JSON.parse response
		 
	end

#effectuer une boucle pour sortir l'ensemble des données
#faire le lien entre les titres de colonnes et les informations comprises dans le hash


#insérer les données dans la table cities

end