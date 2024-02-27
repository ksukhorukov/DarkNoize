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

require_relative './loader'

class Noizer
  include UrlsFetcher
  include VerboseMessages
  include Helpers

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
end