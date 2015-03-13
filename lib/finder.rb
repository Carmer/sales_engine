module Finder

  def find_all_by_parameter(category, parameter, given)
    category.select {|thing| thing.send(parameter) == given}
  end

  def find_by_parameter(category, parameter, given)
    category.find {|thing| thing.send(parameter) == given}
  end
end
