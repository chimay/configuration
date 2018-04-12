;; -*- mode: lisp -*-

;; * Debug

(setq debug-on-error t)

;; * Chemins d’accès aux fichiers à charger

(add-to-list 'load-path "~/racine/config/edit/emacs")

(require 'personnel-chemins "chemins")

;; * Paquets

(require 'personnel-paquets "paquets")

;; * Fonctions

(require 'personnel-fonction "fonction")

;; * Configuration en org-mode / babel

(require 'personnel-orgmode-configuration "orgconfig")

;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
