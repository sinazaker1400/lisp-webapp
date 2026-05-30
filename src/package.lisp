;;; Main application package
(defpackage :lisp-webapp
  (:use :cl :hunchentoot :parenscript :local-time)
  (:export 
   #:start-app
   #:stop-app
   #:*app-server*
   #:*server-port*))

;;; Backend utilities package
(defpackage :lisp-webapp/utilities
  (:use :cl :alexandria)
  (:export 
   #:json-response
   #:get-param
   #:post-param
   #:logged-action))

;;; API handlers package
(defpackage :lisp-webapp/api
  (:use :cl :hunchentoot :lisp-webapp/utilities :cl-json)
  (:export 
   #:register-api-routes))

(defpackage :lisp-webapp/pages
  (:use :cl :hunchentoot)
  (:export
   #:render-index
   #:render-about
   #:register-page-routes))

;;; Frontend code (Parenscript) package
(defpackage :lisp-webapp/frontend
  (:use :cl :parenscript)
  (:export 
   #:generate-main-js
   #:hello-component
   #:fetch-data-component))

(in-package :lisp-webapp)
