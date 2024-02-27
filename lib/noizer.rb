require 'net/http'

class Noizer
  URLS_FILE = 'urls.txt'

  attr_reader :url, :urls_file

  def initialize(urls_file = URLS_FILE)
    @urls_file = urls_file

    perform
  end

  private

  def perform
    addresses.each do |url| 
      @url = url
      
      http_request
    end
  end

  def addresses
    @addresses ||= File.readlines(urls_file)
  end 

  def http_request
    Net::HTTP.new(url).request_get('/')
  end
end