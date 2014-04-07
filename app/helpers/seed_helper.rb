module SeedHelper

  def get_useragent(string)
    user_agent = UserAgent.parse(string)

    client = {}
    client[:browser] = user_agent.browser + ' (' + user_agent.version.to_s + ')'
    client[:os] = user_agent.platform
    
    return client
  end

  def get_ip_location(ip)
    l = Geocoder.search(ip)
    return l[0].country
  end
end
