class ReverseSignValueFormatter < JSONAPI::ValueFormatter
  class << self
    def format(raw_value)
      case raw_value
      when BigDecimal, Integer
        return raw_value * -1
      else
        return raw_value
      end
    end

    def unformat(raw_value)
      super(raw_value)
    end
  end
end
