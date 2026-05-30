(in-package :lisp-webapp/pages)

;;; Helper to generate HTML template
(defun html-template (title body-content)
  "Generate a basic HTML template"
  (format nil "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>~A</title>
    <link rel=\"stylesheet\" href=\"/css/style.css\">
</head>
<body>
    <header>
        <nav>
            <h1>Lisp WebApp</h1>
            <ul>
                <li><a href=\"/\">Home</a></li>
                <li><a href=\"/about\">About</a></li>
            </ul>
        </nav>
    </header>
    <main>
        ~A
    </main>
    <footer>
        <p>&copy; 2026 Built with Common Lisp, Hunchentoot & Parenscript</p>
    </footer>
    <script src=\"/js/main.js\"></script>
</body>
</html>" title body-content))

;;; Homepage
(defun render-index ()
  "Render the homepage"
  (html-template "Home"
    "<h2>Welcome to Lisp WebApp</h2>
     <p>Built with pure Common Lisp backend and Parenscript frontend.</p>
     <div id=\"app-container\">
         <h3>Data from API:</h3>
         <div id=\"api-response\">Loading...</div>
         <button id=\"fetch-btn\">Fetch Data</button>
     </div>
     <div id=\"calculator\">
         <h3>Calculator</h3>
         <input type=\"number\" id=\"num1\" placeholder=\"Number 1\">
         <select id=\"operation\">
             <option value=\"add\">+</option>
             <option value=\"subtract\">-</option>
             <option value=\"multiply\">*</option>
             <option value=\"divide\">/</option>
         </select>
         <input type=\"number\" id=\"num2\" placeholder=\"Number 2\">
         <button id=\"calculate-btn\">Calculate</button>
         <div id=\"calc-result\"></div>
     </div>"))

;;; About page
(defun render-about ()
  "Render the about page"
  (html-template "About"
    "<h2>About This App</h2>
     <p>This is a full-stack Common Lisp web application.</p>
     <h3>Technology Stack:</h3>
     <ul>
         <li><strong>Backend:</strong> Common Lisp + Hunchentoot</li>
         <li><strong>Frontend:</strong> Parenscript (Lisp compiled to JavaScript)</li>
         <li><strong>HTTP Server:</strong> Hunchentoot</li>
     </ul>"))

;;; Register all page routes
(defun register-page-routes ()
  "Initialize all page routes"
  (format t "Page routes registered.~%"))
