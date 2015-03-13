module Finder

  def find_all_by_parameter(respository, parameter, input)
    repository.select {|thing| thing.send(parameter) == input}
  end

  def find_by_parameter(repository, parameter, input)
    repository.find {|thing| thing.send(parameter) == input}
  end
end
