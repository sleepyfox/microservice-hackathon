(ns my-service.core
  (:gen-class)
  (:require [clojurewerkz.machine-head.client :as mh]))

(defn -main
  [& args]
  (let [conn (mh/connect "tcp://mqtt.fluux.io:1883")]
    (mh/subscribe conn {"uservicehack/#" 0} (fn [^String topic _ ^bytes payload]
                                   (println (String. payload "UTF-8"))
                                   (mh/disconnect conn)
                                   (System/exit 0)))
    (mh/publish conn "uservicehack/kittens" "Hello, world!")))
