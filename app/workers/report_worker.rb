class ReportWorker
	include Sidekiq:: Worker
	
	def perform(department)
		url = URI.parse("https://geo.api.gouv.fr/departements/#{department}/communes?fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre")
		response = Net::HTTP.get(url)
		response_hash = JSON.parse response
		response_hash.each do |i|
			puts i["nom"]
			puts i["code"]
			city = City.create!(name: i["nom"], code: i["code"])
			puts city
		end
	end

#faire tourner une boucle each sur l'array de hash response_hash avec pour outpout un hash/block avec les correspondances clés/valeurs de "nom" et "code"
#créer une entrée en base pour chaque élément de l'array

#reponse_hash est un array de hash
#pour chaque hash j'ai un ensemble d'associations clé/valeur
#chaque clé est en string
#je récupère les valeurs associées au name et au code pour le hash "reponse_hash"
#je crée deux variables liées respectivement aux valeurs de name et code
#j'utilise ces variables dans mon create 
#via active record je crée une entrée dans la base cities via une boucle each de reponse_hash avec les clés nom et code 

end