(in-package :lisp-webapp/frontend)

(defun selector->css (selector)
  (let ((name (symbol-name selector)))
    (cond
      ((char= (char name 0) #\:)
       (string-downcase (subseq name 1)))

      ((char= (char name 0) #\#)
       (concatenate 'string "#" (string-downcase (subseq name 1))))

      ((char= (char name 0) #\.)
       (concatenate 'string "." (string-downcase (subseq name 1))))

      (t
       (string-downcase name)))))

(defun property->css (property)
  (destructuring-bind (name value) property
    (format nil
            "  ~a: ~a;~%"
            (string-downcase
             (substitute #\- #\_
                         (symbol-name name)))
            value)))

(defun rule->css (rule)
  (let ((selector (first rule))
        (properties (rest rule)))

    (with-output-to-string (out)

      (format out "~a {~%"
              (selector->css selector))

      (dolist (prop properties)
        (write-string
         (property->css prop)
         out))

      (format out "}~%~%"))))

(defun generate-css ()
  (with-output-to-string (out)

    (dolist (rule *styles*)
      (write-string
       (rule->css rule)
       out))))

(defparameter *styles*

  '((:body

      (:font-family "Arial, sans-serif")
      (:margin "0")
      (:padding "0")
      (:background "#f4f4f4"))

    (:header

      (:background "#333")
      (:color "white")
      (:padding "1rem"))

    (:main

      (:padding "2rem"))

    (:#api-response

      (:background "white")
      (:border "1px solid #ddd")
      (:padding "1rem")
      (:margin-top "1rem"))

    (:button

      (:padding "10px")
      (:margin-top "10px")
      (:cursor "pointer"))

    (:#calculator

      (:margin-top "2rem"))))