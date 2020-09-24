require 'rubygems'
require 'mqtt'

MQTT_HOST = ENV['MQTT_HOST'] || 'mqtt.fluux.io'

# Publish example
MQTT::Client.connect(MQTT_HOST) do |c|
  c.publish('uservicehack/kittens', 'I love kittenz!')
end
