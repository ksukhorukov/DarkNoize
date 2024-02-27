require 'colorize'
require 'colorized_string'

module Greeting 
  def self.colors
  @colors ||= (ColorizedString.colors - [:black, :white, :gray, :light_gray]).shuffle!
end 

  def self.random_color
    colors.sample
  end

  def self.hello
    puts "\n\n.::[STARTING THE DARK NETWORK NOIZE]::.\n\n".colorize(color: random_color, mode: :bold)
  end 
end

