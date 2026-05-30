(in-package :lisp-webapp/frontend)

;;; Parenscript utilities (these compile to JavaScript)
(defpsmacro log-message (msg)
  "Log a message to the browser console"
  `(console.log ,msg))

(defun make-fetch-request (url &key method (headers (create)) body)
  "Make a fetch request (compiles to JavaScript fetch API)"
  (chain (fetch url
                 (create :method (or method "GET")
                         :headers headers
                         :body body))
         (then (lambda (response)
                 (if (chain response ok)
                     (chain response (json))
                     (chain promise (reject (new (-error (chain response status-text)))))))
         (catch (lambda (error)
                  (log-message (+ "Fetch error: " error))))))

(defun element-by-id (id)
  "Get DOM element by ID"
  (document.get-element-by-id id))

(defun set-inner-html (element-id html)
  "Set the inner HTML of an element"
  (setf (chain (element-by-id element-id) inner-html) html))

(defun add-event-listener (element-id event handler)
  "Add an event listener to an element"
  (chain (element-by-id element-id) (add-event-listener event handler)))
