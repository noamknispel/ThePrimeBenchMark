(ns prime.clj
  (:gen-class))

(require '[clojure.math.numeric-tower :as math])

(defn prime? [x]
  (if
    (integer? (math/sqrt x)) false
    (every?
       (fn [y] (not= (mod x y) 0))
       (range 2 (math/ceil (math/sqrt x))))))


(defn -main
  [& args]
  (def v [])
  (def i 0)
  (while (< (count v) (Integer/parseInt (first args)))
    (cond (prime? i) (def v (conj v i)))
    (def i (inc i)))
  (println v))
