;;; -*- mode: emacs-lisp -*-

;;; * Chargement du fichier

(setq use-package-verbose t)

(require 'org)

(org-babel-load-file "~/racine/config/edit/emacs/configuration.org")

;;; * Provide

(provide 'personnel/orgmode-configuration)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
