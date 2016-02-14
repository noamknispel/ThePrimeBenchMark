(ns prime.clj
  (:gen-class))

(require '[clojure.math.numeric-tower :as math])

(defn prime? [x]
  (if
    (integer? (math/sqrt x)) false
    (every?
       (fn [y] (not= (mod x y) 0))
       (range 2 (math/ceil (math/sqrt x))))))

(defn primes-iter [n, i, v]
  (loop [cnt i acc v]
    (if (= (count acc) n) acc
      (recur (inc cnt) (if (prime? cnt) (conj acc cnt) acc)))))

(defn primes [n]
  (if
    (zero? n) []
    (primes-iter n 0 [])))


(defn -main
  [& args]
  (println (primes (Integer/parseInt (first args)))))
