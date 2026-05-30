(in-package :lisp-webapp)

;;; Main entry point to start and stop the app
(defun start-app (&key (port 8080))
  "Start the Lisp WebApp server"
  (format t "~&~%=== Starting Lisp WebApp ===~%")
  (start-server :port port)
  (format t "~&Server is running! Open your browser to: http://127.0.0.1:~D~%" port)
  (format t "~&To stop the server, call (stop-app)~%~%"))

(defun stop-app ()
  "Stop the Lisp WebApp server"
  (stop-server))

;;; Auto-start message
(format t "~&Lisp WebApp loaded. Run (start-app) to start the server.~%")
