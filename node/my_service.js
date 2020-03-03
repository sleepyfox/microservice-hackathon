const mqtt = require('mqtt')

var client  = mqtt.connect('mqtt://test.mosquitto.org')
const service_name = 'kittens'

client.on('connect', function () {
  // The '#' wildcard matches all topics below this one
  client.subscribe('uservicehack/+', function (err) {
    if (!err) {
      client.publish('uservicehack/kittens', `Service: ${service_name} has connected!`)
    }
  })
})

client.on('message', function (topic, message) {
  // message is of type Buffer, so we need to use .toString
  console.log(`Message on topic: ${topic} is: ${message.toString()}`)
  client.end() // Remove this to loop forever
})
