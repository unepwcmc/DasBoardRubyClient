require 'uri'
require 'yaml'
require 'rails'

class DasboardClient
  def self.load_config
    begin
      config_location = Rails.root.join('config/dasboard.yml')
      @@config = YAML.load_file(config_location)[Rails.env]
    rescue Exception => err
      puts config_location
      throw Exception.new("Error loading DasBoard config from #{config_location}: #{err.message}")
    end
  end

  def self.post_stat(metric_name, value, date = Time.now)
    metric_id = @@config["metrics"][metric_name.to_s]

    url = "#{@@config["instance"]}/metrics/#{metric_id}/data"
    data = {
      data: {
        date: date.to_i,
        value: value
      }
    }

    puts `curl -X POST -H "Content-Type: application/json" -d \
      '#{data.to_json}' #{url}`
  end
end

DasboardClient.load_config
