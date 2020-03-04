.PHONY: echo clean build repl shell run

TAG=my_service-1.0.0
# Replace this with your own device user id
ID=502
# Replace this with your docker hub ID if you want to push
USER=me
SERVICE=my_service
export MQTT_HOST=mqtt.fluux.io # Use this if test.mosquitto.org is down

echo:
	@ echo "TAG is" $(TAG)
	@ echo "ID is" $(ID)
	@ echo "USER is" $(USER)
	@ echo "SERVICE is" $(SERVICE)

clean:
	rm -f *~

build:
	docker build \
	--build-arg USER=`whoami` \
	--build-arg UID=$(ID) \
	--build-arg GID=$(ID) \
	-t $(USER)/$(SERVICE):$(TAG) .

repl:
	docker run -it \
	-p 9001:9001 \
	-p 1883:1883 \
	--env MQTT_HOST \
	$(USER)/$(SERVICE):$(TAG) lein repl

shell:
	docker run -it \
	-p 9001:9001 \
	-p 1883:1883 \
	-p 8883:8883 \
	--env MQTT_HOST \
	$(USER)/$(SERVICE):$(TAG) bash

run:
	docker run -it \
	-p 9001:9001 \
	-p 1883:1883 \
	--env MQTT_HOST \
	$(USER)/$(SERVICE):$(TAG) lein run
