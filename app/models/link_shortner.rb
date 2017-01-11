class LinkShortner
  def self.generate_link_code
    array.sample(6).join(',').delete(',')
  end

  def self.array
    [('a'..'z').to_a, ('A'..'Z').to_a, (0..9).to_a].flatten!
  end
end
