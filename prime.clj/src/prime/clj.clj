(ns prime.clj
  (:gen-class))

(require '[clojure.math.numeric-tower :as math])

(defn prime? [x]
  (cond
    (integer? (clojure.math.numeric-tower/sqrt x)) false
    :else (every?
            (fn [y] (not= (mod x y) 0))
            (range 2 (math/sqrt (math/ceil x))))))


(defn -main
  [& args]
  (def v [])
  (def i 0)
  (while (< (count v) (Integer/parseInt (first args)))
    (cond (prime? i) (def v (conj v i)))
    (def i (inc i)))
  (println v))
