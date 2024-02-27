# frozen_string_literal: true

require 'net/http'

module UrlsFetcher
  private

  def fetch(uri, limit = 10)
    return if limit.zero?

    res = Net::HTTP.get_response(URI(uri))
    case res
    when Net::HTTPSuccess
      res
    when Net::HTTPRedirection
      @location = res['Location']
      redirect_info
      fetch(location, limit - 1)
    else
      res.value
    end
  end
end
