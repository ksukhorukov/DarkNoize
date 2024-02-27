require 'net/http'
require 'colorize'
require 'pry'

class Noizer
  URLS_DIR = 'data'
  URLS_FILE = 'urls_big_list.txt'

  attr_reader :current_dir, :url, :urls_file, :location, :current_exception

  def initialize
    perform
  end

  private 

  def perform
    urls.each do |url| 
      @url = url

      info

      begin 
        fetch(url)
      rescue => e  
        @current_exception = e
        error
      end 
    end
  end

  def info 
    puts "[+] Requesting: #{url}".colorize(:green)
  end 

  def redirect_info
    puts "\t[~] Redirected to #{location}".colorize(:blue)
  end

  def error 
    puts "[-] Error: #{error_msg}".colorize(:red) unless error_msg_empty?
  end 

  def error_msg 
    current_exception&.message 
  end 

  def error_msg_empty?
    error_msg&.empty?
  end

  def urls
    @urls ||= File.readlines(urls_file_path).map(&:strip).shuffle!
  end

  def pwd
    @current_dir ||= Dir.pwd
  end 

  def urls_file_path
    @urls_file_path ||= [pwd, '/', URLS_DIR, '/', URLS_FILE].join
  end 

  def fetch(uri, limit = 10)
    return if limit == 0

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