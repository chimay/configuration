;; -*- mode: lisp -*-

;; * Thème

;; empêche emacs d’éditer le fichier en argument, pourquoi ?
;;
(add-to-list 'custom-theme-load-path "~/racine/config/edit/emacs-lite/color")
(when (equal window-system nil) (load-theme 'golden-night-leger t))

;; * Répertoires

(require 'dired-x)
(require 'dired-aux)
(require 'wdired)

(setq default-directory "~/racine/plain/")
(setq delete-by-moving-to-trash t)
(setq trash-directory "~/racine/trash")
(setq dired-listing-switches "--time-style=iso -lhDF")
(setq ls-lisp-dirs-first t)
(setq dired-ls-F-marks-symlinks t)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(add-hook 'dired-mode-hook 'auto-revert-mode)
(setq dired-listing-switches "-lha")
(setq-default dired-omit-files-p t) ; this is buffer-local variable

;; (setq dired-omit-files
;;     (concat dired-omit-files "^\\..*\\.un~"))

(setq dired-omit-files "^\\..*\\.un~")

(setq
 wdired-allow-to-change-permissions t
 wdired-allow-to-redirect-links t
 )

;; * Navigation

(global-set-key [kp-prior] 'scroll-down-command)
(global-set-key [prior]    'scroll-down-command)
(global-set-key [kp-next]  'scroll-up-command)
(global-set-key [next]     'scroll-up-command)
(global-set-key [C-home]      'beginning-of-line)
(global-set-key [C-end]      'end-of-line)
(global-set-key [home]      'beginning-of-buffer)
(global-set-key [end]      'end-of-buffer)

;; * Insertion

(global-set-key [insert]    'overwrite-mode)
(global-set-key [kp-insert] 'overwrite-mode)

;; * Annulation

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z" ) 'undo)

;; * Historique

(define-key minibuffer-local-map (kbd "M-p") 'previous-history-element)
(define-key minibuffer-local-map (kbd "M-n") 'next-history-element)

;; * Tampons

(define-key global-map [remap list-buffers] 'ibuffer)

(defun tampon-precedent ()
 "Va au tampon précédent"
 (interactive)
 (switch-to-buffer nil)
 )

(global-set-key (kbd "C-^") 'tampon-precedent)

;; * Backup

(setq version-control t)
(setq delete-old-versions t)
(setq backup-by-copying t)

(setq kept-new-versions 7)
(setq kept-old-versions 5)

(defconst perso-backup-dir
 (concat (getenv "HOME") "/racine/varia/backup/"))

(setq backup-directory-alist `((".*" . ,perso-backup-dir)))

;; * Autosave

(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 30)

(defconst perso-autosave-dir
 (concat (getenv "HOME") "/racine/varia/autosave/"))

(setq auto-save-list-file-prefix perso-autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,perso-autosave-dir t)))

;; * Compression

(auto-compression-mode t)

;; * Org

(setq org-use-speed-commands t)
(setq org-adapt-indentation nil)
(setq org-list-use-circular-motion t)
(setq org-archive-location "~/racine/plain/orgmode/archive.org::* Fichier %s")
(setq org-export-preserve-breaks nil)
(setq org-list-demote-modify-bullet
      '(("-" . "+") ("+" . "*") ("*" . "-")))

;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
