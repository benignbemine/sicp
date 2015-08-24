; Exercise 1.29.  Simpson's Rule is a more accurate method of numerical
; integration than the method illustrated above. Using Simpson's Rule,
; the integral of a function f between a and b is approximated as

; h/3 * [y0 + 4*y1 + 2*y2 + 4*y3 + ... + 2*yn-2 + 4*yn-1 + yn]

; where h = (b - a)/n, for some even integer n, and yk = f(a + kh).
; (Increasing n increases the accuracy of the approximation.) Define a
; procedure that takes as arguments f, a, b, and n and returns the value
; of the integral, computed using Simpson's Rule. Use your procedure to
; integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare
; the results to those of the integral procedure shown above.

; The procedure shown above:

; (define (integral f a b dx)
;   (define (add-dx x) (+ x dx))
;   (* (sum f (+ a (/ dx 2.0)) add-dx b)
;      dx))

; Answer

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (sum f a next b)
  (cond ((> a b) 0)
        (else (+ (f a)
                 (sum f (next a) next b)))))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))

  (define (yk k)
    (f (+ a (* k h))))

  (define (get-coefficient k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))

  (define (compute-term k)
    (* (get-coefficient k) (yk k)))

  (* (/ h 3)
    (sum compute-term 0 inc n)))
