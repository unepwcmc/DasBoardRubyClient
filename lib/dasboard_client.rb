require 'net/http'
require 'uri'


class DasBoard
  def self.load_config
    begin
      @@config = YAML.load_file(Rails.root.join('config/dasboard.yml'))[Rails.env]
    rescue Exception => err
      puts "Error loading config"
      puts err
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

DasBoard.load_config
