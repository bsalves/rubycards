require_relative 'networking'
require_relative 'utils'
require 'json'

class Application
  def main
    utils = Utils. new
    request = Request. new
    response = request.drawCard(5)
    response.each do |obj|
      card = obj['value'] + ' of ' + obj['suit']
      fileContent = utils.readFile
      utils.write(fileContent + card + "\n")
    end
    puts utils.readFile
  end
end

application = Application. new
application.main
