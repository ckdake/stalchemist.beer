require 'httparty'
require 'json'

module UntappdHelper
  # Fetch brewery information and stats
  def fetch_brewery_info(brewery_id)
    return nil unless untappd_configured?
    
    url = "https://api.untappd.com/v4/brewery/info/#{brewery_id}"
    params = {
      client_id: untappd_client_id,
      client_secret: untappd_client_secret
    }
    
    response = HTTParty.get(url, query: params)
    return nil unless response.code == 200
    
    data = JSON.parse(response.body)
    data['response']['brewery'] if data['response']
  rescue => e
    puts "Error fetching brewery info: #{e.message}"
    nil
  end
  
  # Fetch recent checkins for a brewery
  def fetch_brewery_checkins(brewery_id, limit = 25)
    return [] unless untappd_configured?
    
    url = "https://api.untappd.com/v4/brewery/checkins/#{brewery_id}"
    params = {
      client_id: untappd_client_id,
      client_secret: untappd_client_secret,
      limit: limit
    }
    
    response = HTTParty.get(url, query: params)
    return [] unless response.code == 200
    
    data = JSON.parse(response.body)
    data['response']['checkins']['items'] if data['response'] && data['response']['checkins']
  rescue => e
    puts "Error fetching brewery checkins: #{e.message}"
    []
  end
  
  # Fetch beer information and stats
  def fetch_beer_info(beer_id)
    return nil unless untappd_configured?
    
    url = "https://api.untappd.com/v4/beer/info/#{beer_id}"
    params = {
      client_id: untappd_client_id,
      client_secret: untappd_client_secret
    }
    
    response = HTTParty.get(url, query: params)
    return nil unless response.code == 200
    
    data = JSON.parse(response.body)
    data['response']['beer'] if data['response']
  rescue => e
    puts "Error fetching beer info: #{e.message}"
    nil
  end
  
  # Extract beer ID from Untappd URL
  def extract_beer_id(untappd_url)
    return nil unless untappd_url
    match = untappd_url.match(/\/b\/[^\/]+\/(\d+)/)
    match[1] if match
  end
  
  # Extract brewery ID from Untappd URL
  def extract_brewery_id(untappd_url)
    return nil unless untappd_url
    match = untappd_url.match(/\/w\/[^\/]+\/(\d+)/)
    match[1] if match
  end
  
  # Check if Untappd API is configured
  def untappd_configured?
    !untappd_client_id.nil? && !untappd_client_secret.nil?
  end
  
  # Get client ID from environment or config
  def untappd_client_id
    ENV['UNTAPPD_CLIENT_ID']
  end
  
  # Get client secret from environment or config
  def untappd_client_secret
    ENV['UNTAPPD_CLIENT_SECRET']
  end
  
  # Get brewery stats (total checkins, unique users, etc.)
  def brewery_stats(brewery_id = '83021')
    return nil unless untappd_configured?
    
    info = fetch_brewery_info(brewery_id)
    return nil unless info
    
    {
      name: info['brewery_name'],
      total_checkins: info['stats']['total_count'],
      unique_users: info['stats']['total_user_count'],
      total_beers: info['stats']['beer_count'],
      rating: info['rating']['rating_score']
    }
  rescue => e
    puts "Error getting brewery stats: #{e.message}"
    nil
  end
  
  # Get beer stats from URL
  def beer_stats(untappd_url)
    return nil unless untappd_configured?
    
    beer_id = extract_beer_id(untappd_url)
    return nil unless beer_id
    
    info = fetch_beer_info(beer_id)
    return nil unless info
    
    {
      name: info['beer_name'],
      total_checkins: info['stats']['total_count'],
      unique_users: info['stats']['total_user_count'],
      rating: info['rating_score'],
      rating_count: info['rating_count']
    }
  rescue => e
    puts "Error getting beer stats: #{e.message}"
    nil
  end
end

include UntappdHelper
