class Object

  # recover from a nil result in the middle of a chain
  # by using a default value

  def default v
    self || v
  end

end
