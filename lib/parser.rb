require "csv"

module Parser
   def parse(filepath, filename)
    contents = CSV.open "#{filepath}/#{filename}", headers: true,
                                                   header_converters: :symbol
  end
end
