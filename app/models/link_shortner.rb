class LinkShortner
  def self.process_original_link(url, ip, time)
    code = generate_link_code

    register = { code => { original_url: url,
                           code: code,
                           client_ip: ip,
                           accessed_on: time.to_s } }

    File.open('store.yml', 'a+') { |file| file.write(register.to_yaml) }

    { original_url: url, code: code }
  end

  def self.generate_link_code
    array.sample(6).join(',').delete(',')
  end

  def self.array
    [('a'..'z').to_a, ('A'..'Z').to_a, (0..9).to_a].flatten!
  end
end
