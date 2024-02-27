module Runner
  private 

  def run
    while(true) do 
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
end