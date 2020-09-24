# uService Hackathon Ruby boilerplate

Included here are two small files, the first of which `my_service.rb` that implements a service that loops forever listening for messages, that can be run with:

> $ ruby my_service.rb

and `publish.rb` that publishes a single message to the channel 'uservicehack/kittens', that can be run with:

> $ ruby publish.rb

A slightly more complex file `test_pubsub_loop.rb` is included that sends 100 messages to a channel and then simultaneously reads 100 messages from the same channel.
