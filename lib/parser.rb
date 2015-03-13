require "csv"

class Parser

   def parse(filepath, filename)
    contents = CSV.open "#{filepath}/#{filename}", headers: true, header_converters: :symbol

    contents.map do |row|
      row
    end
  end
end
