;;; -*- mode: emacs-lisp -*-

;;; * Debug

(setq debug-on-error t)

;;; * Chemin d’accès aux fichiers à charger

(add-to-list 'load-path "~/racine/config/edit/emacs")

;;; * Paquets

(require 'personnel/paquets "paquets")

;;; * Perso

(require 'personnel/perso "perso")

;;; * Configuration en org-mode / babel

(require 'personnel/orgmode-configuration "orgconfig")

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
