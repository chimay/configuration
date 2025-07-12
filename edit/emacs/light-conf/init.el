(add-to-list 'load-path "~/racine/dotdir/emacs.d")
(add-to-list 'custom-theme-load-path "~/racine/config/edit/emacs/color")

(setq message-log-max 3000)
(setq debug-on-error t)

(setq inhibit-startup-screen t)
(setq initial-buffer-choice t)
(setq initial-scratch-message ";; Buffer for notes you don’t want to save.\n\n")

(setq custom-file "~/racine/config/edit/emacs/enligne.el")
(load custom-file)

(add-to-list 'default-frame-alist '(font . "Monospace-12" ))

(global-prettify-symbols-mode 1)

(setq blink-cursor-mode nil)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))

(defalias 'yes-or-no-p 'y-or-n-p)

(when (equal window-system 'x) (load-theme 'golden-night-gui t))
(when (equal window-system nil) (load-theme 'golden-night-term t))

;;(setq initial-buffer-choice (lambda ()
;;    (org-agenda-list 30)
;;    (get-buffer "*Org Agenda*")))

(setq	scroll-step 1
	  scroll-margin 7
	  scroll-conservatively 100000
	  scroll-up-agressively 0.01
	  scroll-down-agressively 0.01
	  scroll-preserve-screen-position 1
	  auto-window-vscroll nil)

(setq-default
	  scroll-up-agressively 0.01
	  scroll-down-agressively 0.01)

(setq mouse-wheel-scroll-amount '(5 ((shift) . 10))) ; one line at a time
(setq mouse-wheel-progressive-speed nil)            ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ; scroll window under mouse
(setq scroll-step 1)                                ; keyboard scroll one line at a time

; Activer la coloration syntaxique
(global-font-lock-mode t)
;;(setq font-lock-maximum-decoration '((c-mode . 1) (t . 2)))
(setq font-lock-maximum-decoration t)

(setq visible-bell 1)
(setq visible-bell 'top-bottom)

(setq tags-add-tables nil)

(setq disabled-command-function nil)

; Coupures entre les mots
(global-visual-line-mode -1)
; La flèche vers le bas bouge par lignes visuelles
(setq line-move-visual nil)

(setq indent-tabs-mode nil)
(setq standard-indent 4)
(setq tab-width 4)
(setq c-basic-offset 4)

(setq delete-trailing-lines nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Mode texte en auto-fill par défaut (créé une nouvelle ligne  entre deux mots à
; chaque fois que la ligne courant devient trop longue)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

; en Americain, les phrases (sentences) se terminent par deux espaces
; ce comportement n'est pas souhaitable en francais

(setq sentence-end-double-space nil)

; Eviter que la cesure de fin de ligne, operée par exemple par le
; mode autofill ou par un M-q, coupe au niveau d'un caractere parenthèse ouvrante ou :

(add-hook 'fill-no-break-predicate 'fill-french-nobreak-p)

(setq shift-select-mode nil)
(delete-selection-mode 1)
;(pending-delete-mode t)

(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
;; (setq show-paren-style 'expression)
;; (setq show-paren-style 'mixed)
(setq show-paren-delay 0)
(electric-pair-mode t)
;; Voir aussi smartparens

; Wrap search
(setq isearch-wrap-function nil)
(setq search-default-mode #'char-fold-to-regexp)
(setq replace-char-fold t)

(setq undo-limit 80000)

(setq kill-ring-max 1234)
(setq save-interprogram-paste-before-kill t)

(setq version-control t)
(setq delete-old-versions t)
(setq backup-by-copying t)
(setq kept-new-versions 7)
(setq kept-old-versions 5)
(setq backup-directory-alist '((".*" . "~/racine/varia/backup/emacs/")))

(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 30)
(defconst biblio/autosave-dir
 (concat (getenv "HOME") "/racine/varia/autosave/emacs/"))
(setq auto-save-list-file-prefix biblio/autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,biblio/autosave-dir t)))

;; (global-auto-revert-mode 1)
;; (setq global-auto-revert-non-file-buffers t)
;; (setq auto-revert-verbose nil)

(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq utf-translate-cjk-mode nil)
(setq-default buffer-file-coding-system 'utf-8-unix)
(add-to-list 'file-coding-system-alist '("\\.tex" . utf-8-unix))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; (setq x-select-request-type 'STRING)
;; (setq x-select-request-type 'TEXT)

(setq selection-coding-system 'compound-text-with-extensions)

(auto-compression-mode t)

(require 'tramp)

(require 'dired-x)
(require 'dired-aux)
(require 'wdired)

(setq wdired-allow-to-change-permissions t)
(setq default-directory "~/racine/plain/")
(setq delete-by-moving-to-trash t)
(setq trash-directory "~/racine/trash/emacs")
(setq dired-listing-switches "--time-style=iso -lhDF")
(setq ls-lisp-dirs-first t)
(setq dired-ls-F-marks-symlinks t)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(add-hook 'dired-mode-hook 'auto-revert-mode)

(setq dired-listing-switches "-lha")
(setq-default dired-omit-files-p t)

;; (setq dired-omit-files
;;     (concat dired-omit-files "^\\..*\\.un~"))

(setq dired-omit-files "^\\..*\\.un~")
(setq
 wdired-allow-to-change-permissions t
 wdired-allow-to-redirect-links t)

(autoload 'ibuffer "ibuffer" "List buffers." t)

; nombre de jours
(setq clean-buffer-list-delay-general 1)
; nombre de secondes
(setq clean-buffer-list-delay-special (* 12 3600))

(setq resize-mini-windows t)
(setq max-mini-window-height 30)

(setq enable-recursive-minibuffers t)
(setq minibuffer-auto-raise t)

(setq-default save-place-mode t)
(setq savehist-file (expand-file-name "savehist" user-emacs-directory))
(setq savehist-autosave-interval 300)
(setq save-place-file (expand-file-name "saveplace" user-emacs-directory))
; Important de placer le require après la définition des variables
(require 'saveplace)
(savehist-mode 1)

;; (desktop-save-mode 1)

(setq recentf-max-saved-items 1234)
(setq recentf-max-menu-items 1234)
(setq recentf-save-file (expand-file-name "recentf" user-emacs-directory))

;; disable before we start recentf!
(setq recentf-auto-cleanup 'never)

;; Important de placer le require après la définition des variables
(require 'recentf)

(append recentf-exclude '("*\\.html\\'" "*\\.epub"))
(recentf-mode 1)

(require 'vc)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "bash")

(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
	(kill-buffer)
    (comint-delchar-or-maybe-eof arg)))

(add-hook 'shell-mode-hook
	    (lambda ()
	      (define-key shell-mode-map
		(kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))

(defvar biblio/terminal-shell "/bin/bash")

(defadvice ansi-term (before force-bash)
  (interactive (list biblio/terminal-shell)))

(ad-activate 'ansi-term)

(require 'eshell)
(require 'em-smart)

(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(if (daemonp)
(add-hook 'after-make-frame-functions
  #'(lambda (frame)
   (with-selected-frame frame
(when (equal window-system 'x) (load-theme 'golden-night-gui t))
)))
(when (equal window-system 'x) (load-theme 'golden-night-gui t)))

(setq Info-use-header-line t)
(setq Info-hide-note-references t)

(setq Info-scroll-prefer-subnodes nil)

(setq Info-isearch-search t)

(setq Info-enable-active-nodes nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(which-key-mode)

(require 'org)
(setq org-directory "~/racine/plain/orgmode/")
(setq org-archive-location "~/racine/plain/orgmode/archive.org::* Fichier %s")
(add-hook
 'org-mode-hook
 #'(lambda ()
	(define-key org-mode-map (kbd "s-§") 'helm-org-in-buffer-headings)
    (define-key org-mode-map (kbd "M-§") 'org-sparse-tree)
    (define-key org-mode-map (kbd "C-c l") 'org-store-link)
    (define-key org-mode-map (kbd "C-c a") 'org-agenda)
    (define-key org-mode-map (kbd "C-c c") 'org-capture)
    (define-key org-mode-map (kbd "C-c b") 'org-iswitchb)
    (define-key org-mode-map (kbd "<C-M-return>") 'org-liste-espacee)))

(require 'helm)
(helm-mode 1) ; facultative.
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "M-X") 'helm-minibuffer-history)
(global-set-key (kbd "s-ù") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-é") 'helm-swoop)
(global-set-key (kbd "s-è") 'helm-multi-swoop)
(global-set-key (kbd "s-ç") 'helm-show-kill-ring)
(global-set-key (kbd "s-$") 'helm-etags-select)
(global-set-key (kbd "s--") 'helm-locate)
(global-set-key (kbd "s-<") 'helm-do-grep-ag)
(global-set-key (kbd "s-'") 'helm-all-mark-rings)
(global-set-key (kbd "s-m") 'helm-filtered-bookmarks)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-multi-occur-from-isearch)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(define-key global-map [remap bookmark-bmenu-list] 'helm-filtered-bookmarks)
(define-key global-map [remap insert-register] 'helm-register)
(define-key helm-map (kbd "s-z") 'helm-select-action)
(define-key helm-map (kbd "C-z") 'helm-execute-persistent-action)
(define-key helm-map (kbd "<left>") 'helm-next-source)
(define-key helm-map (kbd "<right>") 'helm-previous-source)
