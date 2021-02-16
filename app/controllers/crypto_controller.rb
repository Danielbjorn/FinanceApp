class CryptoController < ApplicationController

	def index

		require 'net/http'
	  	require 'json'


	  	#Grabs news data
	  	@url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
	  	@uri = URI(@url)
	  	@response = Net::HTTP.get(@uri)
	  	@news = JSON.parse(@response)

	  	#gets news data
	  	@prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,TRX,DOT,XRP,XLM&tsyms=USD'
	  	@prices_uri = URI(@prices_url)
	  	@prices_response = Net::HTTP.get(@prices_uri)
	  	@prices = JSON.parse(@prices_response)



	end


end