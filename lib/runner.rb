# frozen_string_literal: true

module Runner
  private

  def run
    loop do
      urls.each do |url|
        @url = url

        info

        begin
          fetch(url)
        rescue StandardError => e
          @current_exception = e
          error
        end
      end
    end
  end
end
