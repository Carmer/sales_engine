require "csv"

class Parser
  def parse(filename)
    contents = CSV.open "./data/#{filename}", headers: true, header_converters: :symbol

    contents.map do |row|
      row
    end
  end
end
