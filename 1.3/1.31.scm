; Exercise 1.31.

; a. The sum procedure is only the simplest of a vast number of
; similar abstractions that can be captured as higher-order procedures.
; Write an analogous procedure called product that returns the product
; of the values of a function at points over a given range. Show how
; to define factorial in terms of product. Also use product to compute
; approximations to pi using the formula:

      ; pi / 4 = 2 * 4 * 4 * 6 * 6 * 8 * 8 .... / 3 * 3 * 5 * 5 * 7 * 7 ...

(define (product f a next b)
  (cond ((> a b) 1)
        (else (* (f a)
                 (product f (next a) next b)))))


(define (factorial n)
  (define (id x) x)
  (define (inc x) (+ x 1))

  (product id 1 inc n))

(define (pi-approx n)
  (define (inc x) (+ x 1))
  (define (frac k)
    (if (even? k)
      (/ (+ k 2) (+ k 1))
      (/ (+ k 1) (+ k 2))))

  (exact->inexact (* 4 (product frac 1 inc n))))


; b.  If your product procedure generates a recursive process, write
; one that generates an iterative process. If it generates an iterative
; process, write one that generates a recursive process.

(define (product f a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (f a)))))

  (iter a 1))






