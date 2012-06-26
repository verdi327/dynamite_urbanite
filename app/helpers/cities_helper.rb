module CitiesHelper

  def format_as_percentage(string_num)
    float = string_num.to_f*100
    float.to_s[0..1] + '%'
  end

  def format_as_minutes(string_num)
    string_num[0..1] + ' minutes'
  end
end
