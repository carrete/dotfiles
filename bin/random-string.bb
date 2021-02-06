#!/usr/bin/env bb
;; -*- mode: clojure; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

#_(ns random-string
    (:import
     (java.nio.charset
      Charset)))

;; https://stackoverflow.com/a/2580350
#_(defn alphanum
    [charset-name]
    (let [char-encoder (-> charset-name Charset/forName .newEncoder)]
      (->> (range 0 (int Character/MAX_VALUE)) (map char)
           (filter #(and (.canEncode char-encoder %) (Character/isAlphanumeric %))))))

(defonce ^:private ^:dynamic ^java.util.Random *rnd* (java.util.Random.))

(defn- uniform
  (^long []
   (.nextLong *rnd*))
  (^long [lo hi]
   {:pre [(< lo hi)]}
   (long (Math/floor (+ lo (* (.nextDouble *rnd*) (- hi lo)))))))

(defn- printable-ascii-char
  []
  (char (uniform 32 127)))

(defn- printable-ascii-str
  [n]
  (apply str (repeatedly n printable-ascii-char)))

(defn- parse-command-line-args
  [default-args]
  (merge
   default-args
   (edn/read-string (format "{%s}" (str/join " " *command-line-args*)))))

(let [{:keys [n]} (parse-command-line-args {:n 16})]
  (println (printable-ascii-str (int n))))
