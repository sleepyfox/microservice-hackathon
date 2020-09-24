require 'rubygems'
require 'mqtt'

MQTT_HOST = ENV['MQTT_HOST'] || 'mqtt.fluux.io'
puts "Host is set to: #{MQTT_HOST}"

client = MQTT::Client.connect(MQTT_HOST)
raise "Couldn't connect to MQTT broker" unless client

# Publish 100 messages
# Need a thread because .publish and .get are blocking
Thread.new do
  sleep(0.5) # Give the subscriber time to connect
  (1..100).each { |x|
    sleep(0.01)
    puts "writing #{x}"
    client.publish("uservicehack/thing", x.to_s) }
end

# Subscribe, exit on 100th message received
count = 0
# The '#' wildcard subscribes to all topics below this one
client.subscribe('uservicehack/#')
while (count < 100) do
  # .get blocks. If you pass a block to the get method it will loop forever
  topic, message = client.get
  count += 1
  puts "On topic #{topic} got: #{message} total: #{count}"
end
