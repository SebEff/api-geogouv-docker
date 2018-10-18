class MyWorker
  include Sidekiq::Worker
  def perform(name, count)
    logger.info "#{name} says the count is #{count}"
  end
  #api geogouv worker#
  require 'net/http' 
  require "byebug"
  url = URI.parse('https://geo.api.gouv.fr/departements/78/communes?fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre')
  req = Net::HTTP::Get.new(url.to_s)
  puts url.host 
  puts url.port
  res = Net::HTTP.start(url.host, url.port, use_ssl: true) {|http|
  http.request(req)
  }puts res.body
end



20.times do |index|
  MyWorker.perform_in(index, "Bobby", index)
end