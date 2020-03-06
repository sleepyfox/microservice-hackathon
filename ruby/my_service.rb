require 'rubygems'
require 'mqtt'

SERVICE_NAME = 'kittens'
MQTT_HOST = ENV['MQTT_HOST'] || 'mqtt.fluux.io'

# Subscribe example
MQTT::Client.connect(MQTT_HOST) do |c|
  # If you pass a block to the get method, then it will loop
  # The '#' wildcard subscribes to all topics below this one
  c.get('uservicehack/#') do |topic,message|
    puts "On topic #{topic} got: #{message}"
  end
end
