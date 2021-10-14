#lang racket

; Exercise 2.2.1
; Convert the following arithmetic expressions into Scheme expressoins and evalutate them.
(quote --2.2.1--)
; a. 1.2 × (2 - 1/3) + -8.7
(+ (* 1.2 (- 2 1/3)) -8.7)

; b. (2/3 + 4/9) ÷ (5/11 - 4/3)
(/ (+ 2/3 4/9) (- 5/11 4/3))

; c. 1 + 1 ÷ (2 + 1 ÷ (1 + 1/2))
(+ 1 (/ 1 (+ 2 (/ 1 (+ 1 1/2)))))

; d. 1 × -2 × 3 × -4 × 5 × -6 × 7
(* 1 -2 3 -4 5 -6 7)

; Exercise 2.2.2
; Experiment with the procedures +, -, *, and / to determine Scheme's rules
; for the type of value returned by each when given different types of numeric arguments.
(quote --2.2.2--)
(+ 1 1/2 1.0)

; Exercise 2.2.3
; Determine the values of the following expressions. Use your Scheme system to verify your answers.
(quote --2.2.3--)
;  a.	(cons 'car 'cdr)
;  b.	(list 'this '(is silly))
;  c.	(cons 'is '(this silly?))
;  d.	(quote (+ 2 3))
;  e.	(cons '+ '(2 3))
;  f.	(car '(+ 2 3))
;  g.	(cdr '(+ 2 3))
;  h.	cons
;  i.	(quote cons)
;  j.	(quote (quote cons))
;  k.	(car (quote (quote cons)))
;  l.	(+ 2 3)
;  m.	(+ '2 '3)
;  n.	(+ (car '(2 3)) (car (cdr '(2 3))))
;  o.	((car (list + - * /)) 2 3)

; Exercise 2.2.4
; (car (car '((a b) (c d)))) yields a.
; Determine which compositions of car and cdr applied to ((a b) (c d)) yield b, c, and d.
(quote --2.2.4--)
(car (cdr (car '((a b) (c d)))))
(car (car (cdr '((a b) (c d)))))
(car (cdr (car (cdr '((a b) (c d))))))

; Exercise 2.2.5
; Write a Scheme expression that evaluates to the following internal list structure.
;
; [   |   ] -> [   |   ] -> [ () | () ]
;   |            |
;   [ a | b ]    [   |   ] -> [ d | () ]
;                  |
;                  [ c | () ]
(quote --2.2.5--)
(cons (cons 'a 'b) (cons (cons (cons 'c '()) (cons 'd '())) (cons '() '())))

; Exercise 2.2.6
; Draw the internal list structure produced by the expression below
(quote --2.2.6--)
(cons 1 (cons '(2 . ((3) . ())) (cons '(()) (cons 4 5))))
; (cons 4 5) : [ 4 | 5 ]
; '(()) : [ () | () ]
; => (cons '(()) (cons 4 5)) : [   |   ] -> [ 4 | 5 ]
;                                |
;                                [ () | () ]
; => (cons '(2 . ((3) . ())) (cons '(()) (cons 4 5))) :
;    [   |   ] -> [   |   ] -> [ 4 | 5 ]
;      |            |
;      |            [ () | () ]
;      '(2 . ((3) . ()))
;      [ 2 |   ] -> ((3) . ())
;                   [   |   ] -> [ () | () ]
;                     |
;                     [ 3 | () ]
; => (cons 1 (cons '(2 . ((3) . ())) (cons '(()) (cons 4 5)))) :
;    [ 1 |   ] -> [   |   ] -> [   |   ] -> [ 4 | 5 ]
;                   |            |
;                   |            [ () | () ]
;                   |
;                   [ 2 |   ] -> [   |   ] -> [ () | () ]
;                                  |
;                                  [ 3 | () ]

; Exercise 2.2.7
; The behavior of (car (car (car '((a b) (c d))))) is undefined because
; (car '((a b) (c d))) is (a b), (car '(a b)) is a, and (car 'a) is undefined.
; Determine all legal compositions of car and cdr applied to ((a b) (c d)).
(quote --2.2.7--)

(list                '(cdr '((a b) (c d)))                   (cdr '((a b) (c d))))    ; ((c d))
(list           '(cdr (cdr '((a b) (c d))))             (cdr (cdr '((a b) (c d)))))   ; ()
(list           '(car (cdr '((a b) (c d))))             (car (cdr '((a b) (c d)))))   ; (c d)
(list      '(cdr (car (cdr '((a b) (c d)))))       (cdr (car (cdr '((a b) (c d))))))  ; (d)
(list '(cdr (cdr (car (cdr '((a b) (c d)))))) (cdr (cdr (car (cdr '((a b) (c d))))))) ; ()
(list '(car (cdr (car (cdr '((a b) (c d)))))) (car (cdr (car (cdr '((a b) (c d))))))) ; d
(list      '(car (car (cdr '((a b) (c d)))))       (car (car (cdr '((a b) (c d))))))  ; c
(list                '(car '((a b) (c d)))                   (car '((a b) (c d))))    ; (a b)
(list           '(cdr (car '((a b) (c d))))             (cdr (car '((a b) (c d)))))   ; (b)
(list      '(cdr (cdr (car '((a b) (c d)))))       (cdr (cdr (car '((a b) (c d))))))  ; ()
(list      '(car (cdr (car '((a b) (c d)))))       (car (cdr (car '((a b) (c d))))))  ; b
(list           '(car (car '((a b) (c d))))             (car (car '((a b) (c d)))))   ; a

; Exercise 2.2.8
; Try to explain how Scheme expressions are evaluated.
; Does your explanation cover the last example in Exercise 2.2.3?
; higher order function that evaluates to 'operator'

; Exercise 2.3.1
; Write down the steps necessary to evaluate the expression below.
(quote --2.3.1--)
'((car (cdr (list + - * /))) 17 5)
'((car (cdr (+ - * /))) 17 5)
'((car (- * /)) 17 5)
'(- 17 5)
((car (cdr (list + - * /))) 17 5)











































