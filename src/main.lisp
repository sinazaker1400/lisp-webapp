(in-package :lisp-webapp)

;;; Main entry point to start and stop the app
(defun start-app (&key (port 8080))
  (lisp-webapp/frontend:write-js-bundle)

  (format t "~&~%=== Starting Lisp WebApp ===~%")
  (start-server :port port)
  (format t "~&Server is running! Open your browser to: http://127.0.0.1:~D~%" port))

(defun stop-app ()
  "Stop the Lisp WebApp server"
  (stop-server))

;;; Auto-start message
(format t "~&Lisp WebApp loaded. Run (lisp-webapp:start-app) to start the server & Run (lisp-webapp:stop-app) or Ctrl + D to stop it.~%")
