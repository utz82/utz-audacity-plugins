;nyquist plug-in
;version 3
;type process
;preview linear
;name "Chopper..."
;action "chopping..."
;author "utz/irrlicht project"
;copyright "(c) 2018 utz, Released under terms of the MIT License"

;control pstring "Pattern (string of 0s and 1s)" string "" "1000"
;control crepeat "Times to repeat pattern" int "" 1 1 256


(defun string->list (str)
  (if (string= str "")
      '()
    (cons (char str 0)
          (string->list (subseq str 1)))))

;; convert a list of binary digit characters to a list of floats
(defun pstring->pattern (pattern-lst)
  (if (null pattern-lst)
      '()
    (cons (if (char= (car pattern-lst) #\1) 1.0 0.0)
          (pstring->pattern (cdr pattern-lst)))))

(defun repeat-ptn (chunk count)
  (if (= count 0)
      '()
    (append chunk (repeat-ptn chunk (- count 1)))))

(defun flatten (lst)
  (let ((my-lst '()))
    (dolist (x lst my-lst)
      (setf my-lst
            (append my-lst
                    (if (not (listp x))
                        (list x)
                      (flatten x)))))))

;; recursion blows stack, hence list must be created iteratively
(defun make-timekeys (step-size)
  (let ((my-steps '()))
    (dotimes (i (round (/ 1.0 step-size)) my-steps)
      (setf my-steps
            (append my-steps
                    (list (list (* step-size i)
                                (- (* step-size (+ i 1))
                                   0.000001))))))))

(defun make-steps (ptn init-step step-size)
  (mapcar #'(lambda (val keys)
              (list (car keys) val (cadr keys) val))
          ptn
          (make-timekeys step-size)))

(defun pattern->pw-lst (ptn)
  (flatten (make-steps ptn 0.0 (/ 1.0 (length ptn)))))

;; (trace pattern->pw-list make-steps make-timekeys flatten)
;; (room)

(mult S (pwl-list (pattern->pw-lst
		   (repeat-ptn (pstring->pattern (string->list pstring))
			       crepeat))))
