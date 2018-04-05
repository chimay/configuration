;; -*- mode: lisp -*-

;; ==============================
;; * Org mode
;; ==============================

(setq org-goto-interface 'outline-path-completionp)
(setq org-outline-path-complete-in-steps nil)

(setq org-use-speed-commands t)

(setq org-goto-auto-isearch nil)

(setq org-adapt-indentation nil)

(setq org-list-use-circular-motion t)

(org-babel-do-load-languages
  'org-babel-load-languages
  '(
    (emacs-lisp . t)
    (shell t)
    (org t)
    (lilypond t)
    (octave t)
    ))

(require 'org-checklist)

(setq org-list-demote-modify-bullet
      '(("-" . "+") ("+" . "*") ("*" . "-")))

(setq org-export-preserve-breaks nil)

;; Plugin
;;(require 'org-bullets)

(setq org-bullets-face-name (quote org-bullet-face))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-bullets-bullet-list '("☯" "☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ==============================
;; * Impression
;; ==============================

;; Options génériques

(setq lpr-switches '("-o number-up=2" "-o Duplex=DuplexTumble"))

;; Avec lpr

;; (setq lpr-command "lpr")

;; (setq printer-name "Printer_Name")

;; Avec lp

(setq lpr-command "lp")

(setq printer-name nil)

(setq lpr-add-switches nil)
