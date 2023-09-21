;;; -*- mode: emacs-lisp -*-

;;; * Gestionnaire de paquets natif

;; This must come before configurations of installed packages.

;;(require 'package)

;;(package-initialize)

;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;; ** Use-package

;; (unless (package-installed-p 'use-package)
;; 	(package-refresh-contents)
;; 	(package-install 'use-package))

;;; ** Liste de paquets

;;; * Provide

(provide 'personnel/paquets-natif)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
