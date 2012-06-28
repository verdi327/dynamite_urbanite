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
      string_num[0..1] + ' minutes'
    end
  end
end
