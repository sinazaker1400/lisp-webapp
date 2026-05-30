(in-package :lisp-webapp/frontend)

;;; Main app initialization
(defun initialize-app ()
  "Initialize the frontend when the page loads"
  (log-message "App initialized!")
  (setup-fetch-button)
  (setup-calculator))

;;; Fetch data from API
(defun setup-fetch-button ()
  "Set up the data fetch button"
  (add-event-listener "fetch-btn" "click"
    (lambda ()
      (log-message "Fetching data...")
      (set-inner-html "api-response" "Loading...")
      (make-fetch-request "/api/data"
        :method "GET"
        :headers (create :accept "application/json"))
      (chain (make-fetch-request "/api/data")
             (then (lambda (data)
                     (set-inner-html "api-response"
                       (+ "<strong>Message:</strong> " (chain data message) "<br>"
                          "<strong>Status:</strong> " (chain data status)))))
             (catch (lambda (error)
                      (set-inner-html "api-response"
                        (+ "<span style='color:red;'>Error: " error "</span>"))))))))

;;; Calculator component
(defun setup-calculator ()
  "Set up the calculator functionality"
  (add-event-listener "calculate-btn"))

(defun generate-main-js ()
  (ps
    (chain console (log "Lisp WebApp loaded"))

    (let ((button (chain document (get-element-by-id "fetch-btn"))))
      (when button
        (chain button
               (add-event-listener
                "click"
                (lambda ()
                  (chain console (log "clicked"))))))))
)
