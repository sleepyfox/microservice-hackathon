require 'rubygems'
require 'mqtt'

MQTT_HOST = ENV['MQTT_HOST'] || 'mqtt.fluux.io'
puts "Host is set to: #{MQTT_HOST}"

# Publish 100 messages
Thread.new do
  sleep(0.5)
  MQTT::Client.connect(MQTT_HOST) do |c|
    (1..100).each { |x|
      sleep(0.01)
      puts "writing #{x}"
      c.publish("uservicehack/thing", x.to_s) }
  end
end

# Subscribe indefinitely, exit on 100th message received
count = 0
MQTT::Client.connect(MQTT_HOST) do |c|
  # If you pass a block to the get method, then it will loop forever
  # The '#' wildcard subscribes to all topics below this one
  c.get('uservicehack/#') do |topic, message|
    count += 1
    puts "On topic #{topic} got: #{message} total: #{count}"
    exit if count == 100
  end
end
