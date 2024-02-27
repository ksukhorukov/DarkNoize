# Copyright 2024 KIRILL SUKHORUKOV

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License V.3
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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

  def executable_path
    @executable_path ||= $0
  end 

  def executable_name
    :darknoize
  end

  def project_directory 
    @project_directory ||= executable_path.split('')[0, executable_path.length - executable_name.length].join
  end 

  def urls_file_path
    @urls_file_path ||= [project_directory, URLS_DIR, '/', URLS_FILE].join
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