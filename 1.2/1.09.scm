; Exercise 1.9

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
; => 9

; This process is recursive. This process involves a chain of
; deferred operations. there is hidden information (namely how
; many inc's will be done to the current iteration after it returns)
; maintained by the interpreter, and not contained in the program variables.


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
; => 9

; This process is iterative. Every operation is fully
; resolved at each call. At any point in the process
; the state can be summarized by the variables a and b.
; there is no hidden information maintained by the interpreter.
; if we stopped computation, all we would need to resume is to
; supply the interpreter with the last a and b.