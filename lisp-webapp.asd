(asdf:defsystem "lisp-webapp"
  :version "0.1.0"
  :description "Full-stack Common Lisp web application with Hunchentoot & Parenscript"
  :author "Your Name"
  :license "MIT"
  
  :depends-on ("hunchentoot"
               "parenscript"
               "cl-json"
               "alexandria"
               "local-time")
  
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "utilities/helpers" :depends-on ("package"))
                 (:file "server" :depends-on ("package" "utilities/helpers"))
                 (:file "handlers/pages" :depends-on ("server"))
                 (:file "handlers/api" :depends-on ("server"))
                 (:file "frontend/utils" :depends-on ("package"))
                 (:file "frontend/components" :depends-on ("frontend/utils"))
                 (:file "routes" :depends-on ("handlers/pages" "handlers/api"))
                 (:file "main" :depends-on ("routes"))))))
