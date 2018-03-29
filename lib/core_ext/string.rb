class String
  def is_chinese?
    !scan(/\p{Han}/).blank?
  end
end
