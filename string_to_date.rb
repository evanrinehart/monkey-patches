require 'date'

class String

  # to_date
  # "2015-02-28"         ==> Feb 28, 2015
  # "2015-02-28\n"       ==> Feb 28, 2015
  # "2015-02-34"         ==> error or nil
  # "2015-02-28 bad"     ==> error or nil
  # "02-28-2015"         ==> error or nil
  # "2015"               ==> error or nil

  def to_date
    trimmed = self.strip
    if !trimmed.match /\A\d\d\d\d-\d\d-\d\d\z/
      raise ArgumentError, "invalid date"
    else
      Date.parse trimmed
    end
  end

  def to_date_nil
    begin
      self.to_date
    rescue ArgumentError => e
      if e.message == "invalid date"
        nil
      else
        raise e
      end
    end
  end

end
