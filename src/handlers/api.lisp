(in-package :lisp-webapp/api)

;;; Sample API endpoint (GET request)
(hunchentoot:define-easy-handler (get-data :uri "/api/data") ()
  "Return JSON data"
  (setf (hunchentoot:content-type*) "application/json")
  (let ((data (list :message "Hello from the backend!"
                    :timestamp (local-time:format-rfc3339 (local-time:now))
                    :status "success")))
    (json:encode-json-to-string data)))

;;; API endpoint with POST parameter
(hunchentoot:define-easy-handler (calculate :uri "/api/calculate"
                                             :default-request-type :post) 
    ((num1 :parameter-type 'integer :init-form 0)
     (num2 :parameter-type 'integer :init-form 0)
     (operation :parameter-type 'string :init-form "add"))
  "Calculate operation on two numbers"
  (setf (hunchentoot:content-type*) "application/json")
  (let* ((result (case (intern (string-upcase operation))
                   (:add (+ num1 num2))
                   (:subtract (- num1 num2))
                   (:multiply (* num1 num2))
                   (:divide (if (zerop num2)
                              "error: division by zero"
                              (/ num1 num2)))
                   (otherwise "error: unknown operation")))
         (response (list :result result
                         :operation operation
                         :inputs (list :num1 num1 :num2 num2))))
    (json:encode-json-to-string response)))

;;; Register all API routes
(defun register-api-routes ()
  "Initialize all API routes"
  (format t "API routes registered.~%"))
