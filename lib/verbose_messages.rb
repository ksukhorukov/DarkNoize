require 'colorize'

module VerboseMessages
  private 
  
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
end