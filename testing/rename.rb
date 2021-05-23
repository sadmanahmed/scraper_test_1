require 'fileutils'
filenames = Dir.glob("*.csv")

filenames.each do |filename|
    File.rename(filename, filename.gsub(/sheba.csv/, '') + ".csv")
end
