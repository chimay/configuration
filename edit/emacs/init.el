;;; -*- mode: emacs-lisp -*-

;;; * Debug

(setq debug-on-error t)

;;; * Chemin d’accès aux fichiers à charger

(add-to-list 'load-path (expand-file-name "~/racine/config/edit/emacs"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/racine/config/edit/emacs/color"))

;;; * Paquets

(require 'personnel/paquets-elpaca "paquets-elpaca")

;;; * Perso

(require 'personnel/perso "perso")

;;; * Configuration en org-mode / babel

(require 'personnel/orgmode-configuration "orgconfig")

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
