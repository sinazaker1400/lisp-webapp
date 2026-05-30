(in-package :lisp-webapp/utilities)

;;; JSON response helper
(defun json-response (data)
  "Encode data as JSON string"
  (json:encode-json-to-string data))

;;; Parameter extraction helpers
(defun get-param (name)
  "Get query parameter from URL"
  (hunchentoot:get-parameter name))

(defun post-param (name)
  "Get POST parameter from request body"
  (hunchentoot:post-parameter name))

;;; Logging helper
(defun logged-action (action &rest args)
  "Log an action with timestamp"
  (format t "[~A] ~A ~{~A ~}~%" 
          (local-time:now) 
          action 
          args))
