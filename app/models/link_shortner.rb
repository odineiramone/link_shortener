class LinkShortner
  def self.find_link(code)
    config = YAML.load_file('store.yml')
    record = config.fetch(code[:code]) if config.keys.include?(code[:code])
    record[:original_url]
  end


  def self.process_original_link(url, ip, time)
    code = generate_link_code
    store_file = Sinatra::Application.settings.store_file

    record = { code => { original_url: url,
                           code: code,
                           client_ip: ip,
                           accessed_on: time.to_s } }


    File.open(store_file, 'a+') do |file|
      file.write(record.to_yaml)
    end

    # remove dashes (---) from yml file
    system("sed -i -e 's/---//g' #{store_file}")

    { original_url: url, code: code }
  end

  private

  def self.generate_link_code
    array.sample(6).join(',').delete(',')
  end

  def self.array
    [('a'..'z').to_a, ('A'..'Z').to_a, (0..9).to_a].flatten!
  end
end
