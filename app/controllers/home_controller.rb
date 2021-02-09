
class HomeController < ApplicationController

  def index



  	# ----------------- THIS CODE BELONGS TO CRYPTO CURRENCY API ---------------------
  	
  	require 'net/http'
  	require 'json'

  	@url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@news = JSON.parse(@response)


  	# ----------------- THIS CODE BELONGS TO CRYPTO CURRENCY API ---------------------

  end


end
