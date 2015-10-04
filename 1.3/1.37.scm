; Exercise 1.37. Suppose that n and d are procedures of one argument
; (the term index i) that return the Ni and Di of the
; terms of the continued fraction. Define a procedure
; cont-frac such that evaluating (cont-frac n d k)
; computes the value of the k-term finite continued
; fraction. Check your procedure by approximating
; 1/goldenratio using

(/ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100))

; for successive values of k. How large must you make k in
; order to get an approximation that is accurate to 4 decimal places?

; a.) recursive

(define (cont-frac n d k)
  (define (cont-frac-recur n d i k)
    (if (= k i) (/ (n i) (d i))
          (/ (n i) (+ (d i) (cont-frac-recur n d (+ i 1) k)))))

  (cont-frac-recur n d 1 k))

; b.) iterative

(define (cont-frac n d k)
  (define (cont-frac-iter n d k val)
    (let ((updated-val (/ (n k) (+ (d k) val))))
         (if (= k 1) updated-val
         (cont-frac-iter n d (- k 1) updated-val))))

  (cont-frac-iter n d k 0)))

