(defproject my-service "1.0.0-SNAPSHOT"
  :description "Clojure event-driven services workshop boilerplate"
  :url ""
  :license {:name "MIT Public License"
            :url "https://opensource.org/licenses/MIT"}
  :dependencies [[org.clojure/clojure "1.10.1"]
                 [clojurewerkz/machine_head "1.0.0"]]
  :main ^:skip-aot my-service.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
