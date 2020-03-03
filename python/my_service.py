#!/usr/bin/python3 -u
import os
import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish

MQTT_HOST=os.getenv("MQTT_HOST", "test.mosquitto.org").strip()
print("Will connect to "+str(MQTT_HOST))

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("uservicehack/#") # the '#' wildcard matches all topics below this one

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    print(msg.topic + " " + msg.payload.decode("ascii"))

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect(MQTT_HOST, 1883, 60)
client.loop_start()

# Publish a single message on the topic
publish.single("uservicehack/kittens", "minikatz are great!", hostname=MQTT_HOST)

# Blocking call that processes network traffic, dispatches callbacks and
# handles reconnecting.
# Other loop*() functions are available that give a threaded interface and a
# manual interface.
while True:
    1
client.loop_stop() # Never gets here
