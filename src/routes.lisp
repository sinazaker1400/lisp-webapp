(in-package :lisp-webapp)

(hunchentoot:define-easy-handler (index :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html; charset=utf-8")
  (lisp-webapp/pages:render-index))

(hunchentoot:define-easy-handler (about :uri "/about") ()
  (setf (hunchentoot:content-type*) "text/html; charset=utf-8")
  (lisp-webapp/pages:render-about))

(format t "Routes registered.~%")