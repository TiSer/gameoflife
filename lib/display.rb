module Display
  def self.show(field)
    system("clear")
    puts field.to_s.gsub('0', ' ').gsub('1', '▧')
  end
end
