class String

  def to_date_nil
    if !self.match /\d\d\d\d-\d\d-\d\d/
      nil
    else
      begin
        Date.parse self
      rescue ArgumentError
        nil
      end
    end
  end

  def to_date
    self.to_date_nil || raise(ArgumentError, "invalid date")
  end

end
