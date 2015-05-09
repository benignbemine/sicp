; Exercise 1.12.

; The following pattern of numbers is called Pascal's triangle.

;                   1
;                  / \
;                 1   1
;                / \ / \
;               1   2   1
;              / \ / \ / \
;             1   3   3   1
;            / \ / \ / \ / \
;           1   4   6   4   1


; The numbers at the edge of the triangle are all 1,
; and each number inside the triangle is the sum of the
; two numbers above it. Write a procedure that computes
; elements of Pascal's triangle by means of a recursive process.

; takes the row and index of the triangle as arguments.
; return the number at that place.
(define (pascal row index)
  (cond ((= row 1) 1)
        ((= index 1) 1)
        ((= row index) 1)
        (else   (+ (pascal (- row 1) (- index 1))
                   (pascal (- row 1) index)))))



; function which prints out the rows
; of the pascal triangle using
; the function above.

(define (call-pascal row index max-row)
  (display (pascal row index))
  (display #\Space)
  (cond ((= row max-row) 1)
        ((= row index) (newline) (call-pascal (+ row 1) 1 max-row))
        (else (call-pascal row (+ index 1) max-row))))


(call-pascal 1 1 10)
; 1 ]=> (call-pascal 1 1 10)1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1
; 1 5 10 10 5 1
; 1 6 15 20 15 6 1
; 1 7 21 35 35 21 7 1
; 1 8 28 56 70 56 28 8 1
; 1
; ;Value: 1