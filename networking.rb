require 'net/http'
require 'json'

class Request
  def drawCard(count = 1)
    count = count.to_s
    deckId = fetchDeck["deck_id"]
    draw = fetch('https://deckofcardsapi.com/api/deck/'+deckId+'/draw/?count='+count)
    return draw["cards"]
  end

  private
  def fetch(url)
    url = URI.parse(url)
    request = Net::HTTP::Get.new(url.to_s)
    response = Net::HTTP.start(url.host, url.port, :use_ssl => true) do |http|
      http.request(request)
    end
    return JSON.parse(response.body)
  end

  def fetchDeck
    return fetch('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
  end
end
