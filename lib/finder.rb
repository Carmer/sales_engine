module Finder

  def find_all_by(repository, column_header, input)
    repository.select {|thing| thing.send(column_header) == input}
  end

  def find_by(repository, column_header, input)
    repository.find {|thing| thing.send(column_header) == input}
  end

  def find_as_string(repository, column_header, input)
    repository.find do |thing|
      thing.send(column_header).to_s.upcase == input.upcase
    end
  end

  def find_all_as_string(repository, column_header, input)
    repository.select do |thing|
      thing.send(column_header).to_s.upcase == input.upcase
    end
  end
end
