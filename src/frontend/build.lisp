#| (in-package :lisp-webapp/frontend)

(defun write-js-bundle ()
  (ensure-directories-exist #p"static/js/")

  (with-open-file (out #p"static/js/main.js"
                       :direction :output
                       :if-exists :supersede
                       :if-does-not-exist :create)
    (write-string (generate-main-js) out))) |#

(in-package :lisp-webapp/frontend)

(defun write-js-bundle ()
  (ensure-directories-exist #p"static/js/")

  (with-open-file (out #p"static/js/main.js"
                       :direction :output
                       :if-exists :supersede
                       :if-does-not-exist :create)

    (write-string (generate-main-js) out)))