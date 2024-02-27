# frozen_string_literal: true

module Helpers
  URLS_DIR = 'data'
  URLS_FILE = 'urls_big_list.txt'

  private

  def executable_name
    :darknoize
  end

  def urls
    @urls ||= File.readlines(urls_file_path).map(&:strip).shuffle!
  end

  def executable_path
    @executable_path ||= $PROGRAM_NAME
  end

  def project_directory
    @project_directory ||= executable_path.split('')[0, executable_path.length - executable_name.length].join
  end

  def urls_file_path
    @urls_file_path ||= [project_directory, URLS_DIR, '/', URLS_FILE].join
  end
end
