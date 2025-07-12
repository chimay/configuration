(setq Info-use-header-line t)
(setq Info-hide-note-references t)

(setq Info-scroll-prefer-subnodes nil)

(setq Info-isearch-search t)

(setq Info-enable-active-nodes nil)

(require 'server)
(unless (server-running-p) (server-start))

(add-to-list 'load-path "~/racine/dotdir/emacs.d")
(add-to-list 'custom-theme-load-path "~/racine/config/edit/emacs/color")

(setq custom-file "~/racine/config/edit/emacs/enligne.el")
(load custom-file)

(setq message-log-max 3000)
(setq debug-on-error t)

(setq gc-cons-threshold 20000000)

;;(require 'bytecomp)
;;(byte-recompile-directory "~/racine/config/edit/emacs" 0)

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)
(setq initial-buffer-choice t)
(setq initial-scratch-message ";; Buffer for notes you don’t want to save.\n\n")
(setq initial-buffer-choice (lambda ()
    (org-agenda-list 30)
    (get-buffer "*Org Agenda*")))

;;(set-frame-font "Monospace-11")
;;(add-to-list 'default-frame-alist '(font . "Monospace-11" ))
;;(set-frame-font "monofur-14")
;;(add-to-list 'default-frame-alist '(font . "monofur-14" ))
;;(set-frame-font "Fantasque\ Sans\ Mono-12")
(add-to-list 'default-frame-alist '(font . "Fantasque\ Sans\ Mono-12" ))

(global-prettify-symbols-mode 1)

(setq blink-cursor-mode nil)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; (require 'linum)
;; (global-linum-mode 1)
;; (setq line-number-display-limit nil)
;; (line-number-mode t)
;; (column-number-mode t)
;; (global-hl-line-mode 0)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))

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

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(setq visible-bell 1)
(setq visible-bell 'top-bottom)

;; (when (equal window-system 'x) (load-theme 'golden-night-gui t))
;; (when (equal window-system nil) (load-theme 'golden-night-term t))

;; (if (daemonp)
;;   (add-hook 'after-make-frame-functions
;;     #'(lambda (frame)
;;      (with-selected-frame frame
	;;  (when (equal window-system 'x) (load-theme 'golden-night-gui t))
	;;  )))
;;   (when (equal window-system 'x) (load-theme 'golden-night-gui t)))

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

; y / n au lieu de yes / no
(defalias 'yes-or-no-p 'y-or-n-p)

;: Fait automatiquement
;;(require 'epa-file)
;;(epa-file-enable)

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

(setq savehist-file (expand-file-name "savehist" user-emacs-directory))
(setq savehist-autosave-interval 300)
(setq save-place-file (expand-file-name "saveplace" user-emacs-directory))
(setq-default save-place t)
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

;; Nothing yet

;; (setq user-mail-address "your@mail")
;; (setq user-full-name "Tic Tac")

;(setq mail-sources '((pop :server "pop.provider.org" :user "you" :password "secret")))

;;(setq smtpmail-default-smtp-server "smtp.server.org")
;;(setq smtpmail-smtp-server "smtp.server.org")
;;(setq smtpmail-local-domain "server.org")
;(setq smtpmail-auth-credentials '(("hostname" "port" "username" "password")))
;(setq smtpmail-starttls-credentials '(("hostname" "port" nil nil)))
;;(load-library "smtpmail")
;;(setq send-mail-function 'smtpmail-send-it)
;;(setq message-send-mail-function 'smtpmail-send-it)

;;(setq rmail-preserve-inbox t)
;;(setq rmail-primary-inbox-list
;;      '("/var/spool/mail/user"
;;	"~/racine/mail/Systeme/mbox"
;;       ))
;;(setq rmail-ignored-headers
;;      (concat rmail-ignored-headers
;;	      "\\|^x-.*:\\|^IronPort-PHdr.*:\\|^Received.*:\\|^DKIM.*:"))

(setq compilation-window-height 12)

;; use gdb-many-windows by default
(setq gdb-many-windows t)

;; Non-nil means display source file containing the main routine at startup
(setq gdb-show-main t)

;; Options génériques
(setq lpr-switches '("-o number-up=2" "-o Duplex=DuplexTumble"))

;; Avec lpr
;; (setq lpr-command "lpr")
;; (setq printer-name "Officejet_5740")

;; Avec lp
(setq lpr-command "lp")
(setq printer-name nil)
(setq lpr-add-switches nil)

(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "qutebrowser")

(setq-default major-mode 'text-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq python-shell-interpreter "python")
(setq python-shell-completion-native nil)

;(ispell-change-dictionary "francais" t)
;(setq ispell-dictionary "francais")

(setq lexical-binding t)

(defun biblio/edite-configuration-org ()
  (interactive)
  (find-file "~/racine/config/edit/emacs/configuration.org")
  (cd "~/racine/config/edit/emacs"))

(defun biblio/recharge-configuration-org ()
  "Reloads configuration.org at runtime"
  (interactive)
  (org-babel-load-file "~/racine/config/edit/emacs/configuration.org"))

(defun biblio/affiche-copie-nom-fichier ()
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name)))

(defun biblio/debut-fin-fichier ()
  (interactive)
  (if (eq (point) (point-min))
	(goto-char (point-max))
    (goto-char (point-min))))

(defun biblio/demi-page-bas ()
  "scroll down half the page"
  (interactive)
  (scroll-up (/ (window-body-height) 2)))

(defun biblio/demi-page-haut ()
  "scroll up half the page"
  (interactive)
  (scroll-down (/ (window-body-height) 2)))

(defun biblio/efface-mot ()
  (interactive)
  (forward-char 1)
  (backward-word)
  (kill-word 1))

(defun biblio/efface-jusque-debut-ligne ()
(interactive)
(kill-line 0))

(defun biblio/efface-contenu-ligne ()
  (interactive)
  (beginning-of-line)
  (kill-line))

(defun biblio/copie-mot ()
  (interactive)
  (forward-char 1)
  (backward-word)
  (kill-word 1)
  (undo-boundary)
  (undo))

(defun biblio/copie-jusque-debut-ligne ()
  (interactive)
  (save-excursion
    (kill-new (buffer-substring
		 (point-at-bol)
		 (point)))))

(defun biblio/copie-jusque-fin-ligne ()
  (interactive)
  (save-excursion
    (kill-new (buffer-substring
		 (point)
		 (point-at-eol)))))

(defun biblio/copie-contenu-ligne ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring-no-properties
	(point-at-bol)
	(point-at-eol)))))

(defun biblio/copie-ligne ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring-no-properties
	(line-beginning-position 1)
	(line-beginning-position 2))))
  ;; Old version
  ;; (kill-whole-line)
  ;; (undo-boundary)
  ;; (undo)
  )

(defun biblio/copie-phrase ()
  (interactive)
  (save-excursion
    (let ((one)
	    (two))
	(backward-sentence)
	(setq one (point))
	(forward-sentence)
	(setq two (point))
	(kill-new (buffer-substring-no-properties one two))))
  ;; (kill-sentence)
  ;; (undo-boundary)
  ;; (undo)
  )

(defun biblio/copie-sexp ()
  "Copie une sexp lisp"
  (interactive)
  (save-excursion
    (let ((one)
	    (two))
	;; (backward-sexp)
	(setq one (point))
	(forward-sexp)
	(setq two (point))
	(kill-new (buffer-substring-no-properties one two))))
  ;; (kill-sexp)
  ;; (undo-boundary)
  ;; (undo)
  )

(defun biblio/alterne-deux-derniers-tampons ()
 "Visite alternativement les deux derniers tampons édités"
 (interactive)
 (switch-to-buffer nil))

(defun biblio/ferme-tampon-courant ()
  "Supprime le tampon courant."
  (interactive)
  (kill-buffer (current-buffer)))

(defun biblio/ferme-tous-les-tampons ()
  "Ferme tous les tampons."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun biblio/revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
	(when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
	  (revert-buffer t t t) )))
  (message "Refreshed open files.") )

(defun biblio/aller-au-tampon-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun biblio/aller-au-tampon-grenier ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (find-file "Grenier")
  (end-of-buffer))

(defun biblio/scinde-et-suit-horizontalement ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun biblio/scinde-et-suit-verticalement ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(defun biblio/insertion-date () (interactive)
  (insert (shell-command-to-string "echo -n $(date +'%d %b %Y')")))

(defun biblio/insertion-date-jour () (interactive)
  (insert (shell-command-to-string "echo -n $(date +'%a %d %b %Y')")))

(defun biblio/insertion-date-jour-heure () (interactive)
  (insert (shell-command-to-string "echo -n $(date +'%H : %M %a %d %b %Y')")))

(defun biblio/style-sous-curseur ()
  (interactive)
  (what-cursor-position t))

(defun biblio/lignes-vides-simples ()

  (interactive)

  (goto-char (point-min))

  (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
    (replace-match "\n")
    (forward-char 1))

  (goto-char (point-min))
)

(defun biblio/lignes-doubles-avant-titres ()

  (interactive)

  (goto-char (point-min))

  (while (re-search-forward "\\(^\\*+ \\)" nil t)
    (replace-match (concat "\n" (match-string 1)) t nil))

  (goto-char (point-min))
)

(require 'personnel-fonction "fonction")

(global-unset-key (kbd "<f5>"))
(global-unset-key (kbd "<f6>"))
(global-unset-key (kbd "<f7>"))
(global-unset-key (kbd "<f8>"))
(global-unset-key (kbd "<f9>"))
(global-unset-key (kbd "<f10>"))
(global-unset-key (kbd "<f11>"))
(global-unset-key (kbd "C-x C-z"))

(global-set-key (kbd "<f5> e") 'biblio/edite-configuration-org)

(global-set-key (kbd "<f5> r") 'biblio/recharge-configuration-org)

(global-set-key (kbd "<f7> e") 'eval-buffer)

(global-set-key (kbd "<f6> t") 'list-faces-display)

;;(global-set-key (kbd "M-:") 'execute-extended-command)
;;(global-set-key (kbd "M-;") 'keyboard-quit)
;;(define-key minibuffer-local-map (kbd "M-;") 'minibuffer-keyboard-quit)

;; (global-set-key (kbd "s-R" ) 'recentf-open-files)
;; (define-key minibuffer-local-map (kbd "M-p") 'previous-history-element)
;; (define-key minibuffer-local-map (kbd "M-n") 'next-history-element)
;; (define-key minibuffer-local-map (kbd "M-p") 'previous-complete-history-element)
;; (define-key minibuffer-local-map (kbd "M-n") 'next-complete-history-element)
(define-key minibuffer-local-map (kbd "<up>") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "<down>") 'next-complete-history-element)

(global-set-key (kbd "s-z s-z") 'save-buffers-kill-emacs)

;;(global-set-key (kbd "s-*") 'find-name-dired)

(global-set-key [kp-prior] 'biblio/demi-page-haut)
(global-set-key [prior]    'biblio/demi-page-haut)
(global-set-key [kp-next]  'biblio/demi-page-bas)
(global-set-key [next]     'biblio/demi-page-bas)
(global-set-key (kbd "C-v") 'scroll-up-command)
(global-set-key (kbd "M-v") 'scroll-down-command)
(global-set-key (kbd "s-a") 'backward-paragraph)
(global-set-key (kbd "s-e") 'forward-paragraph)
(global-set-key (kbd "C-$")  'biblio/debut-fin-fichier)

(global-set-key (kbd "s-\"") 'bookmark-set)
(global-set-key (kbd "s-3")   'bookmark-bmenu-list)

;;(global-set-key (kbd "M-*") 'find-tag)
;;(global-set-key (kbd "M-,") 'pop-tag-mark)
;;(global-set-key (kbd "M-.") 'tags-loop-continue)

(global-set-key [insert]    'overwrite-mode)
(global-set-key [kp-insert] 'overwrite-mode)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z" ) 'undo)
;; Redo : M-_

(global-set-key (kbd "<S-delete>") 'biblio/efface-mot)
(global-set-key (kbd "<M-delete>") 'biblio/efface-contenu-ligne)
(global-set-key (kbd "<C-delete>") 'kill-whole-line)
;; Rappelle le C-u de Unix
(global-set-key (kbd "s-u") 'biblio/efface-jusque-debut-ligne)
;; (global-set-key (kbd "C-k") 'kill-line)
(global-set-key (kbd "<C-backspace>") 'backward-kill-word)
(global-set-key (kbd "<M-backspace>") 'biblio/efface-mot)
(global-set-key (kbd "<S-backspace>") 'just-one-space)

;; M-w pour copier
;; C-w pour couper
;; C-y pour coller
;; M-y pour faire tourner le yank-ring
;; (global-set-key (kbd "M-y") 'yank-pop)
(global-set-key (kbd "<S-insert>") 'biblio/copie-mot)
(global-set-key (kbd "<M-insert>") 'biblio/copie-contenu-ligne)
(global-set-key (kbd "<C-insert>") 'biblio/copie-ligne)
;; Rappelle le C-u de Unix
(global-set-key (kbd "s-U") 'biblio/copie-jusque-debut-ligne)
(global-set-key (kbd "<C-S-insert>") 'biblio/copie-jusque-fin-ligne)

(global-set-key (kbd "s-v") 'cua-rectangle-mark-mode)

;;(global-set-key (kbd "C-x s-r") 'string-insert-rectangle)
;;(global-set-key (kbd "C-x s-r") 'string-rectangle)

(global-set-key (kbd "s-7") 'repeat)

;;(define-key isearch-mode-map (kbd "M-p") 'isearch-ring-retreat)
;;(define-key isearch-mode-map (kbd "M-n") 'isearch-ring-advance)
(global-set-key (kbd "s-r") 'rgrep)

(setq hippie-expand-try-functions-list
	'(try-expand-dabbrev
	  try-expand-dabbrev-all-buffers
	  try-expand-dabbrev-from-kill
	  try-expand-all-abbrevs
	  try-expand-list
	  try-expand-line
	  try-complete-file-name-partially
	  try-complete-file-name
	  try-complete-lisp-symbol-partially
	  try-complete-lisp-symbol))
(global-set-key (kbd "M-SPC") 'hippie-expand)

(global-set-key (kbd "<f11> o") 'flyspell-mode)
; Espaces
(global-set-key (kbd "<f11> s") 'whitespace-mode)

(global-set-key (kbd "<s-kp-0>") 'delete-window)
(global-set-key (kbd "<s-kp-1>") 'delete-other-windows)
(global-set-key (kbd "<s-kp-2>") 'biblio/scinde-et-suit-horizontalement)
(global-set-key (kbd "<s-kp-3>") 'biblio/scinde-et-suit-verticalement)
(global-set-key (kbd "<s-kp-7>") 'other-window)
(when (fboundp 'windmove-default-keybindings) (windmove-default-keybindings))
(global-set-key (kbd "<S-up>") 'windmove-up)
(global-set-key (kbd "<S-down>") 'windmove-down)
(global-set-key (kbd "<S-right>") 'windmove-right)
(global-set-key (kbd "<S-left>") 'windmove-left)
(global-set-key (kbd "<s-kp-8>") 'windmove-up)
(global-set-key (kbd "<s-kp-5>") 'windmove-down)
(global-set-key (kbd "<s-kp-6>") 'windmove-right)
(global-set-key (kbd "<s-kp-4>") 'windmove-left)
(global-set-key (kbd "C-x ^") 'enlarge-window)
(global-set-key (kbd "C-x _") 'shrink-window)
(global-set-key (kbd "C-x }") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x {") 'shrink-window-horizontally)
(global-set-key (kbd "<f11> f") 'follow-mode)

;; Remplacé par torus-alternate
;; (global-set-key (kbd "C-^") 'biblio/alterne-deux-derniers-tampons)

(define-key global-map [remap list-buffers] 'ibuffer)

(global-set-key (kbd "<f7> r") 'revert-buffer)
(global-set-key (kbd "<f7> R") 'biblio/revert-all-buffers)

(global-set-key (kbd "C-x k") 'biblio/ferme-tampon-courant)

(global-set-key (kbd "C-M-s-k") 'biblio/ferme-tous-les-tampons)

(global-set-key (kbd "<f7> c") 'clean-buffer-list)

(global-set-key (kbd "s-à") 'narrow-to-region)

(global-set-key (kbd "<f7> s") 'biblio/aller-au-tampon-scratch)
(global-set-key (kbd "<f7> g") 'biblio/aller-au-tampon-grenier)

;; Lancer et répondre "!" pour sauver tous les tampons modifiés
;; (global-set-key (kbd "C-x s") 'save-some-buffers)
(global-set-key (kbd "<f7> n") 'biblio/affiche-copie-nom-fichier)

(global-set-key (kbd "C-=") 'eval-expression)
(global-set-key (kbd "C-M-u") 'backward-up-list)
(global-set-key (kbd "C-M-d") 'down-list)
(global-set-key (kbd "<C-up>") 'backward-up-list)
(global-set-key (kbd "<C-down>") 'down-list)
(global-set-key (kbd "C-M-f") 'forward-sexp)
(global-set-key (kbd "C-M-b") 'backward-sexp)
(global-set-key (kbd "<C-right>") 'forward-sexp)
(global-set-key (kbd "<C-left>") 'backward-sexp)
(global-set-key (kbd "C-M-n") 'forward-list)
(global-set-key (kbd "C-M-p") 'backward-list)
(global-set-key (kbd "<C-M-right>") 'forward-list)
(global-set-key (kbd "<C-M-left>") 'backward-list)
(global-set-key (kbd "C-M-a") 'beginning-of-defun)
(global-set-key (kbd "C-M-e") 'end-of-defun)

;; Plus général avec outline

;; (global-set-key (kbd "M-p") 'beginning-of-defun)
;; (global-set-key (kbd "M-n") 'end-of-defun)

(global-set-key (kbd "M-(") 'insert-parentheses)
(global-set-key (kbd "M-)") 'move-past-close-and-reindent)
(global-set-key (kbd "C-M-k") 'kill-sexp)
(global-set-key (kbd "s-y") 'biblio/copie-sexp)
(global-set-key (kbd "s-k") 'kill-sexp)

;; Slurp & Barf, Split & Splice : voir smartparens

;; Interactive Emacs-Lisp Mode
(global-set-key (kbd "<s-return>") 'ielm)

(global-set-key (kbd "C-|") 'shell-command-on-region)
(global-set-key (kbd "C-!") 'shell)
(global-set-key (kbd "s-!") 'eshell)
(global-set-key (kbd "<s-kp-enter>") 'ansi-term)

(global-set-key (kbd "<f8>") 'compile)

(global-set-key (kbd "C-&") 'calc)

(global-set-key (kbd "s-d") 'biblio/insertion-date)
(global-set-key (kbd "s-D") 'biblio/insertion-date-jour)

(define-prefix-command 'caracteres/map)

(global-set-key (kbd "<f9>") 'caracteres/map)

(define-key caracteres/map (kbd "<") (lambda () (interactive) (insert "⟻")))
(define-key caracteres/map (kbd ">") (lambda () (interactive) (insert "⟼")))
(define-key caracteres/map (kbd "SPC") (lambda () (interactive) (insert " ")))
(define-key caracteres/map (kbd "'") (lambda () (interactive) (insert "’")))
(define-key caracteres/map (kbd "a") (lambda () (interactive) (insert "â")))
(define-key caracteres/map (kbd "e") (lambda () (interactive) (insert "ê")))
(define-key caracteres/map (kbd "i") (lambda () (interactive) (insert "î")))
(define-key caracteres/map (kbd "o") (lambda () (interactive) (insert "ô")))
(define-key caracteres/map (kbd "u") (lambda () (interactive) (insert "û")))

(global-set-key [down-mouse-2]   'mouse-flash-position-or-M-x)
(global-set-key [S-down-mouse-2] 'mouse-scan-lines-or-M-:)

(global-set-key (kbd "s-l") 'linum-mode)
(global-set-key (kbd "<f11> l") 'hl-line-mode)

(global-set-key (kbd "<f6> c") 'biblio/style-sous-curseur)

(use-package org)

(setq org-directory "~/racine/plain/orgmode/")
(setq org-archive-location "~/racine/plain/orgmode/archive.org::* Fichier %s")

;; Commandes org accessibles au 1er * de chaque titre
(setq org-use-speed-commands t)

;; Pas d’indentation auto pour suivre la hiérarchie
(setq org-adapt-indentation nil)

(setq org-list-use-circular-motion t)
(setq org-export-preserve-breaks nil)
(setq org-ellipsis " [...]")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)
(setq org-confirm-babel-evaluate nil)
(setq org-export-with-smart-quotes t)

(setq org-goto-auto-isearch nil)
(setq org-goto-interface 'outline-path-completionp)
(setq org-outline-path-complete-in-steps nil)

(defun org-liste-espacee ()
  "Passer une ligne avant Meta-return"
  (interactive)
  (org-meta-return)
  (beginning-of-visual-line)
  (newline)
  (end-of-visual-line))

(add-hook
 'org-mode-hook
 #'(lambda ()
    (define-key org-mode-map (kbd "s-§") 'org-goto)
    (define-key org-mode-map (kbd "M-§") 'org-sparse-tree)
    (define-key org-mode-map (kbd "C-c l") 'org-store-link)
    (define-key org-mode-map (kbd "C-c a") 'org-agenda)
    (define-key org-mode-map (kbd "C-c c") 'org-capture)
    (define-key org-mode-map (kbd "C-c b") 'org-iswitchb)
    (define-key org-mode-map (kbd "<C-M-return>") 'org-liste-espacee)))

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (shell t)
    (org t)
    (lilypond t)
    (octave t)))

;;(require 'org-checklist)
(require 'org-tempo)

(setq org-agenda-span 30)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-start-day nil)
(setq org-agenda-include-diary nil)

(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

(setq org-treat-S-cursor-todo-selection-as-state-change nil)
;; (setq org-use-fast-todo-selection t)
;; (setq org-todo-keywords
;;       (quote
;;        ((sequence "TODO(t!)" "DONE(d!)" "MAYBE(m!)" "WAIT(w@/!)" "|" "CANCELLED(c@)"))))

(setq org-default-notes-file "~/racine/plain/orgmode/notes.org")
(setq org-capture-templates
	'(("a" "Agenda" entry
	   (file+olp "~/racine/plain/orgmode/agenda.org" "Agenda" "Unique")
	   "* TODO %?\nSCHEDULED: %^{Agenda}T \nLien : %a\n\n%i" :empty-lines 1)
	  ("t" "Todo : Liste de tâches" entry
	   (file+headline "~/racine/plain/orgmode/taches.org" "Tâches")
	   "* TODO %?\n\nCréé le : %U\n\nLien : %a\n\n%i" :empty-lines 1)
	  ("f" "Fix : Astuces, résolution de bugs" entry
	   (file+headline "~/racine/plain/orgmode/astuces.org" "Astuces")
	   "* %?\n\nCréé le : %U\n\nLien : %a\n\n%i" :empty-lines 1)
	  ("l" "Log : Journal de bord du capitaine" entry
	   (file+olp+datetree "~/racine/plain/orgmode/journaldebord.org" "Journal")
	   "* %?\n\nCréé le %U\n\nLien : %a\n\n%i" :empty-lines 1)
	  ("d" "Dreamtime : Rêverie" entry
	   (file+olp+datetree "~/racine/plain/orgmode/reverie.org" "Rêverie")
	   "* %?" :empty-lines 1)
	  ("e" "Éducation" entry
	   (file+olp+datetree "~/racine/plain/orgmode/education.org" "Éducation")
	   "* %?" :empty-lines 1)
	  ("n" "Notes" entry
	   (file+headline "~/racine/plain/orgmode/notes.org" "Notes")
	   "* %?\n\nCréé le : %U\n\nLien : %a\n\n%i" :empty-lines 1)))

;; (setq org-refile-targets '((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9)))
(setq org-refile-targets '((nil :maxlevel . 9)))

;; Show full paths for refiling
(setq org-refile-use-outline-path t)

(setq org-list-demote-modify-bullet
	'(("-" . "+") ("+" . "*") ("*" . "-")))
(use-package org-bullets)
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("☯" "☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (fset 'efface-tag
;;    (lambda (&optional arg) "Keyboard macro." (interactive "p")
;;       (kmacro-exec-ring-item (quote ([19 60 return 2 134217828 134217828 134217828 4 4] 0 "%d")) arg)))
;;
;; (global-set-key (kbd "C-x C-k 0") 'efface-tag)
