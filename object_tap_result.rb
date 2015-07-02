class Object

  # use a block in a chain, for real though

  def tap_result
    yield self
  end

end
