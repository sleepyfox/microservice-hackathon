require 'rubygems'
require 'mqtt'

MQTT_HOST = 'test.mosquitto.org'

# Publish example
MQTT::Client.connect(MQTT_HOST) do |c|
  c.publish('uservicehack/kittens', "I love kittenz!")
end
