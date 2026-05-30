(in-package :lisp-webapp)

;;; Route dispatcher
(hunchentoot:define-easy-handler (index :uri "/") ()
  "Homepage route"
  (setf (hunchentoot:content-type*) "text/html; charset=utf-8")
  (lisp-webapp/pages:render-index))

(hunchentoot:define-easy-handler (about :uri "/about") ()
  "About page route"
  (setf (hunchentoot:content-type*) "text/html; charset=utf-8")
  (lisp-webapp/pages:render-about))

;;; Catch-all for 404s
(hunchentoot:define-easy-handler (not-found :uri "/.*" :default-request-handler t) ()
  "Handle 404 errors"
  (setf (hunchentoot:return-code*) hunchentoot:+http-not-found+)
  "<h1>404 - Page Not Found</h1>")

(format t "Routes registered.~%")
