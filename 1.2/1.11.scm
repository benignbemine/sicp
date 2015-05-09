; Exercise 1.11.
; A function f is defined by the rule that f(n) = n if n<3 and
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.

; Write a procedure that computes f by means of a recursive process.

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))


; Write a procedure that computes f by means of an iterative process.

(define (f-iter n)
  (f-iter-procedure n 0 1 2))

(define (f-iter-procedure n a b c)
  (if (= n 0)
      a
      (f-iter-procedure (- n 1)
                        b
                        c
                        (+ c (* 2 b) (* 3 a)))))
