(in-package :lisp-webapp)

;;; Global server instance
(defvar *app-server* nil
  "The Hunchentoot server instance")

(defvar *server-port* 8080
  "Port for the web server")

;;; Configure the acceptor (HTTP listener)
(defun create-acceptor (&optional (port *server-port*))
  "Create and configure the Hunchentoot acceptor"
  (make-instance 'hunchentoot:easy-acceptor
                 :port port
                 :address "127.0.0.1"
                 :document-root #p"static/"))

;;; Server lifecycle management
(defun configure-server ()
  "Initial server configuration"
  (format t "~&=== Server Configuration ===~%")
  (format t "Port: ~D~%" *server-port*)
  (format t "Base URL: http://127.0.0.1:~D~%" *server-port*))

(defun start-server (&key (port *server-port*))
  "Start the Hunchentoot server"
  (when *app-server*
    (format t "Server already running. Use (stop-app) first.~%")
    (return-from start-server nil))
  
  (setf *server-port* port)
  (configure-server)
  (setf *app-server* (create-acceptor port))
  (hunchentoot:start *app-server*)
  (format t "Server started at http://127.0.0.1:~D~%" port)
  *app-server*)

(defun stop-server ()
  "Stop the Hunchentoot server"
  (when *app-server*
    (hunchentoot:stop *app-server*)
    (setf *app-server* nil)
    (format t "Server stopped.~%"))
  (unless *app-server*
    (format t "Server is not running.~%")))
