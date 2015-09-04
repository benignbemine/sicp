; Exercise 1.35.  Show that the golden ratio  (section 1.2.2)
; is a fixed point of the transformation x -> 1 + 1/x, and use
; this fact to compute the golden ratio by means of the
; fixed-point procedure.

; The golden ratio represents:

; --|-----
; 1  x

; x -> 1 + 1/x
; x^2 - x - 1 = 0;
; using the quadratic equation, we get zero's equal to
; (1/2 * (1 + sqrt(5)))
; (1/2 * (1 - sqrt(5)))


(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))




