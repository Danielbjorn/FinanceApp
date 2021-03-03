
class HomeController < ApplicationController

  def index

  		require 'net/http'
	  	require 'json'

	  	#gets data
	  	@prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ADA,BNB,RUNE,SAND&tsyms=USD'
	  	@prices_uri = URI(@prices_url)
	  	@prices_response = Net::HTTP.get(@prices_uri)
	  	@prices = JSON.parse(@prices_response)


	  	

	  	

  end


end
