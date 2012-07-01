module CitiesHelper

  def format_as_percentage(string_num)
    if string_num == 'N/A'
      'N/A'
    else
      float = string_num.to_f*100
      float.to_s[0..1] + '%'
    end
  end

  def format_as_minutes(string_num)
    if string_num == 'N/A'
      'N/A'
    else
      string_num[0..1]
    end
  end

  def to_dollars(num)
    dollar_value = num / 100
    "$" + number_with_delimiter(dollar_value, delimiter: ",")
  end

  def as_photo(string)
    "http://" + string
  end
end
