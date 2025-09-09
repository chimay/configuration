; -*- lisp -*-

; Utiliser
;	M-x list-faces-display
; pour afficher les réglages courants
; et
;	M-x list-colors-display
; pour afficher les couleurs disponibles

(deftheme golden-night-gui "Thème couleur sombre, version gui.")

(custom-theme-set-faces 'golden-night-gui

;; * Base

	'(default ((t (:background "black" :foreground "#5B3C11"))))

	'(italic ((t (:italic t))))
	'(bold ((t (:bold t :weight bold))))

	'(bold-italic ((t (:bold t :italic t :slant italic :weight bold))))

	'(border ((t (:background "black" :foreground "#5B3C11" ))))

	'(cursor ((t (:background "#5B3C11"))))

	'(border ((t (:background "black" :foreground "#5B3C11"))))

	'(buffer-menu-buffer ((t (:bold t :weight bold))))

	'(link ((t (:underline t :background "black" :foreground "#5B3C11"))))

	'(nobreak-space ((t (:underline t :background "black" :foreground "#5B3C11"))))

	'(button ((t (:underline t :foreground "#5B3C11" :background "black"))))

	'(excerpt ((t (:italic t))))

	'(success ((t (:background "black" :foreground "#5B3C11"))))

	'(warning ((t (:background "black" :foreground "#872E30"))))
	'(error ((t (:background "black" :foreground "#872E30"))))
	'(shadow ((t (:italic t :background "black" :foreground "#5b3c11"))))

;; * Texte

	'(match ((t (:bold t :background "#5B3C11" :foreground "black"))))

	'(region ((t (:bold t :background "#5B3C11" :foreground "black"))))

	'(cua-global-mark ((t (:background "black" :foreground "#5B3C11"))))
	'(cua-rectangle ((t (:bold t :background "#5B3C11" :foreground "black"))))

	'(secondary-selection ((t (:italic t :background "#5B3C11" :foreground "black"))))

	'(header-line ((t (:height 1.2 :bold t :background "black" :foreground "#5B3C11"))))

;; * Highlight

	'(highlight ((t (:background unspecified :underline t))))
	'(hl-line ((t (:background "#120507" :underline nil))))

;; * Parenthèses

	'(show-paren-match ((t (:bold t :background "black" :foreground "darkred"))))
	'(show-paren-match-face ((t (:bold t :background "black" :foreground "darkred"))))
	'(show-paren-mismatch ((t (:underline t :bold t :background "black" :foreground "darkred"))))

	'(paren-blink-off ((t (:foreground "black"))))
	'(paren-mismatch-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))
	'(paren-no-match-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))

;; * Marge

	'(linum ((t (:background "black" :foreground "#5B3C11"))))
	'(fringe ((t (:background "#070707" :foreground "#5B3C11"))))

;; * Supra

	'(tool-bar ((t (:background "black" :foreground "#5B3C11"))))
	'(tooltip ((t (:background "black" :foreground "#5B3C11"))))

	'(widget-field ((t (:background "black" :foreground "#5B3C11"))))
	'(widget-single-line-field ((t (:background "black" :foreground "#5B3C11"))))
	'(widget-documentation ((t (:background "black" :foreground "#5B3C11"))))

;; * Tab bar

	'(tab-bar ((t (:background "black" :foreground "#5B3C11" :bold t))))
	'(tab-bar-tab ((t (:background "#5B3C11" :foreground "black" :bold t))))
	'(tab-bar-tab-group-current ((t (:background "black" :foreground "#5B3C11" :bold t))))
	'(tab-bar-tab-group-inactive ((t (:background "black" :foreground "#5B3C11" :bold t))))
	'(tab-bar-tab-inactive ((t (:background "black" :foreground "#5B3C11" :bold t))))

;; Tab line

	'(tab-line ((t (:background "black" :foreground "#5B3C11" :bold t))))
	'(tab-line-hihglight ((t (:background "black" :foreground "#5B3C11" :bold t))))
	'(tab-line-tab ((t (:background "black" :foreground "#5B3C11"))))
	'(tab-line-tab-current ((t (:background "#5B3C11" :foreground "black"))))
	'(tab-line-tab-group ((t (:background "black" :foreground "#5B3C11"))))
	'(tab-line-tab-inactive ((t (:background "black" :foreground "#5B3C11"))))
	'(tab-line-tab-inactive-alternate ((t (:background "black" :foreground "#5B3C11"))))

;; * Infra

;; * Modeline

	'(mode-line ((t (
		:background unspecified :foreground unspecified :inverse-video t :bold t
		;; :box '(:line-width -1 :style released-button)
		:height 1.0
	))))

	'(mode-line-buffer-id ((t (
		:background "#070707" :foreground unspecified
		:bold t :height 1.0
	))))

	'(mode-line-inactive ((t (:foreground unspecified :background "#070707"))))

	'(mode-line-emphasis ((t (:bold t :weight bold))))

	'(mode-line-highlight ((t (
		;; :box (:line-width 2 :color nil :style released-button :height 0.9)
	))))

	'(mode-line-inactive ((t (
		:background "#070707" :foreground unspecified
		;; :box '(:line-width 0 :color nil)
		:weight light :height 0.9
	))))

;; * Minibuffer

	'(minibuffer-prompt ((t (:foreground "#5B3C11" :height 1.0))))

;; * Font-lock

	'(font-lock-builtin-face       ((t (:foreground "#5B3C11"))))
	'(font-lock-constant-face      ((t (:foreground "#5B3C11" :bold t))))
	'(font-lock-preprocessor-face  ((t (:foreground "#5B3C11" :italic t))))
	'(font-lock-keyword-face       ((t (:foreground "#5B3C11"))))
	'(font-lock-type-face          ((t (:foreground "#5B3C11"))))
	'(font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
	'(font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
	'(font-lock-variable-name-face ((t (:foreground "#5B3C11"))))
	'(font-lock-function-name-face ((t (:foreground "#5B3C11" :weight normal :height 1.0))))
	'(font-lock-string-face        ((t (:foreground "#5B3C11"))))
	'(font-lock-comment-face       ((t (:italic t :slant oblique :foreground "#5B3C11"))))
	'(font-lock-comment-delimiter-face ((t (:foreground "#5B3C11"))))
	'(font-lock-doc-face           ((t (:italic t :slant oblique :foreground "#5B3C11"))))
	'(font-lock-doc-string-face    ((t (:foreground "#5B3C11"))))
	'(font-lock-warning-face ((t (:bold t :foreground "#5B3C11" :weight bold))))

;; * Info

	'(Info-quoted ((t (:underline t :weight normal :background "black" :foreground "#5B3C11"))))
	'(info-xref ((t (:underline t :weight normal :background "black" :foreground "#5B3C11"))))
	'(info-xref-visited ((t (:underline t :background "black" :foreground "#5B3C11"))))

	'(info-menu-5 ((t (:underline t))))
	'(info-menu-header ((t (:bold t :weight bold))))
	'(info-node ((t (:bold t :italic t :foreground "#5B3C11"))))
	'(info-node ((t (:italic t :bold t :foreground "#5B3C11" :slant italic :weight bold))))
	'(info-xref ((t (:bold t :foreground "#5B3C11"))))
	'(info-xref ((t (:bold t :foreground "#5B3C11" :weight bold))))

;; * Dired

	'(dired-directory ((t (:background "black" :foreground "#5B3C11"))))
	'(dired-symlink ((t (:background "black" :foreground "#5B3C11"))))
	'(dired-header ((t (:background "black" :foreground "#5B3C11"))))

	'(dired-mark ((t (:background "black" :foreground "#872E30" :bold t))))
	'(dired-marked ((t (:background "black" :foreground "#872E30"))))
	'(dired-flagged ((t (:background "black" :foreground "#800517"))))
	'(dired-ignored ((t (:background "black" :foreground "#5B3C11"))))

	'(dired-warning ((t (:background "black" :foreground "#5B3C11" :bold t))))

	'(dired-async-failure ((t (:background "black" :foreground "#872E30"))))
	'(dired-async-message ((t (:background "black" :foreground "#872E30"))))
	'(dired-async-mode-message ((t (:background "black" :foreground "#872E30"))))

	'(dired-filter-group-header ((t (:background "black" :foreground "#5B3C11" :height 1.1))))

	'(diredp-dir-heading ((t (:background "black" :foreground "#5B3C11"))))

	'(diredp-file-name ((t (:background "black" :foreground "#5B3C11"))))
	'(diredp-autofile-name ((t (:background "black" :foreground "#5B3C11"))))
	'(diredp-file-suffix ((t (:background "black" :foreground "#5B3C11"))))
	'(diredp-dir-name ((t (:background "black" :foreground "#5B3C11"))))
	'(diredp-symlink ((t (:background "black" :foreground "#5B3C11"))))
	'(diredp-link-priv ((t (:background "black" :foreground "#5B3C11"))))

	'(diredp-compressed-file-name ((t (:background "black" :foreground "#5B3C11"))))
	'(diredp-compressed-file-suffix ((t (:background "black" :foreground "#5B3C11"))))

	'(diredp-date-time ((t (:background "black" :foreground "#5B3C11"))))

	'(diredp-flag-mark ((t (:background "black" :foreground "#872E30" :bold t))))
	'(diredp-flag-mark-line ((t (:background "black" :foreground "#872E30"))))
	'(diredp-ignored-file-name ((t (:background "black" :foreground "#5B3C11"))))

;; * Grep

	'(wgrep-face ((t (:background "black" :foreground "#5B3C11"))))
	'(wgrep-file-face ((t (:background "black" :foreground "#5B3C11"))))
	'(wgrep-done-face ((t (:background "black" :foreground "#5B3C11"))))
	'(wgrep-reject-face ((t (:background "black" :foreground "#872E30"))))
	'(wgrep-delete-face ((t (:background "black" :foreground "darkred"))))


;; * Compilation

	'(compilation-column-number ((t (:foreground "#5B3C11"))))
	'(compilation-error ((t (:bold t :weight bold :foreground "#5B3C11"))))
	'(compilation-info ((t (:bold t :foreground "#5B3C11" :weight bold))))
	'(compilation-line-number ((t (:foreground "#5B3C11"))))
	'(compilation-message-face  ((t (:underline t))))
	'(compilation-warning ((t (:bold t :foreground "#5B3C11" :weight bold))))
	'(compilation-warning-face ((t (:bold t :foreground "#5B3C11" :weight bold))))
	'(compilation-mode-line-exit ((t (:foreground "#5B3C11"))))

	'(completions-common-part ((t (
		:width normal :height 1.0
		:weight normal :slant normal
		:foreground "#5B3C11"
	))))

;; * Custom

	'(custom-link ((t (:underline t :background "black" :foreground "#5B3C11"))))
	'(custom-button ((t (:border nil :background "black" :foreground "#5B3C11"))))
	'(custom-set ((t (:background "black" :foreground "#5B3C11"))))
	'(custom-themed ((t (:background "black" :foreground "#5B3C11"))))

	'(custom-button-face ((t (
		:background "black" :foreground "#5B3C11"
		:box '(:line-width 2 :style released-button)
	))))

	'(custom-button-pressed ((t (:border nil :background "black" :foreground "#5B3C11"))))
	'(custom-button-pressed-face ((t (:background "black" :foreground "#5B3C11" :box '(:line-width 2 :style pressed-button)))))
	'(custom-button-pressed-unraised ((t (:border nil :background "black" :foreground "#5B3C11"))))
	'(custom-button-unraised ((t (:border nil :background "black" :foreground "#5B3C11"))))
	'(custom-button-mouse ((t (:border nil :background "black" :foreground "#5B3C11"))))

	'(custom-changed-face ((t (:foreground "#5B3C11"))))
	'(custom-comment ((t (:background "black"))))
	'(custom-comment-face ((t (:background "black"))))
	'(custom-comment-tag-face ((t (:foreground "#5B3C11"))))
	'(custom-face-tag-face ((t (:bold t :weight bold :height 1.1))))
	'(custom-group-tag-face ((t (:bold t :foreground "#5B3C11" :weight bold :height 1.1))))
	'(custom-group-tag-face-1 ((t (:bold t :foreground "#5B3C11" :weight bold :height 1.1))))
	'(custom-invalid-face ((t (:background "black" :foreground "#5B3C11"))))
	'(custom-modified-face ((t (:background "black" :foreground "#5B3C11"))))
	'(custom-rogue-face ((t (:background "black" :foreground "#5B3C11"))))
	'(custom-saved-face ((t (:underline t))))
	'(custom-set-face ((t (:background "black" :foreground "#5B3C11"))))
	'(custom-state ((t (:foreground "#5B3C11"))))
	'(custom-state-face ((t (:foreground "#5B3C11"))))

	'(custom-variable-button-face ((t (
		:bold t :underline t :weight bold
		:background "black" :foreground "#5B3C11"
		:box '(:line-width 2 :style released-button)
	))))

	'(custom-variable-tag-face ((t (:bold t :foreground "#5B3C11" :weight bold :height 1.2))))

;; * Isearch

	'(isearch ((t (:background "black" :foreground "#5B3C11"))))
	'(isearch-fail ((t (:background "black" :foreground "darkred"))))
	'(isearch-lazy-highlight-face ((t (:background "black"))))
	'(isearch-secondary ((t (:foreground "#5B3C11"))))

;; * Tabbar

	'(tabbar-default ((t (:background "black" :foreground "#5B3C11" :height 0.8))))
	'(tabbar-modified ((t (:background "black" :foreground "#5B3C11" :height 0.8))))

	'(tabbar-selected ((t (:background "#5B3C11" :foreground "black" :height 0.8))))
	'(tabbar-selected-modified ((t (:background "#5B3C11" :foreground "black" :height 0.8))))

;; * Popup

	'(popup-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-menu-face ((t (:background "#070707" :foreground "#88421D"))))
	'(popup-menu-summary-face ((t (:background "#070707" :foreground "#88421D"))))
	'(popup-menu-selection-face ((t (:background "#5B3C11" :foreground "black"))))

	'(popup-scroll-bar-background-face ((t (:background "black"))))
	'(popup-scroll-bar-foreground-face ((t (:background "#122312"))))

	'(popup-tip-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-menu-mouse-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-isearch-match ((t (:background "#5B3C11" :foreground "black"))))

;; * Eshell

	'(eshell-prompt ((t (:bold nil :background "black" :foreground "#5B3C11"))))

	'(eshell-ls-archive ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-backup ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-clutter ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-directory ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-executable ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-missing ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-product ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-readonly ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-special ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-symlink ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-ls-unreadable ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-test-failed-face ((t (:bold nil :background "black" :foreground "#5B3C11"))))
	'(eshell-test-ok-face ((t (:bold nil :background "black" :foreground "#5B3C11"))))

;; * Org

	'(org-ellipsis ((t (:underline nil))))
	'(org-scheduled ((t (:foreground "#5B3C11"))))
	'(org-agenda-date ((t (:foreground "#5B3C11"))))
	'(org-agenda-date-weekend ((t (:bold t :foreground "#5B3C11" :weight bold))))
	'(org-agenda-done ((t (:foreground "#5B3C11"))))
	'(org-agenda-restriction-lock ((t (:background "skyblue4"))))
	'(org-agenda-structure ((t (:foreground "#5B3C11"))))
	'(org-archived ((t (:foreground "#5B3C11"))))
	'(org-code ((t (:foreground "#5B3C11"))))
	'(org-column ((t (:background "black" :foreground "#5b3c11" :slant normal :weight normal :height 81))))
	'(org-column-title ((t (:bold t :background "black" :foreground "#5b3c11" :underline t :weight normal))))
	'(org-agenda-column-dateline ((t (:background "black" :foreground "#5b3c11" :slant normal :weight normal :height 81))))
	'(org-date ((t (:foreground "#5B3C11" :underline t))))
	'(org-document-info ((t (:bold t :weight bold))))
	'(org-document-info-keyword ((t (:bold t :weight bold))))
	'(org-document-title ((t (:bold t :weight bold))))
	'(org-done ((t (:bold t :foreground "#5B3C11" :weight bold))))
	'(org-drawer ((t (:foreground "#5B3C11"))))
	'(org-ellipsis ((t (:foreground "#5B3C11" :underline t))))
	'(org-formula ((t (:foreground "#5B3C11"))))
	'(org-headline-done ((t (:foreground "#5B3C11"))))
	'(org-block ((t (:foreground "#5B3C11"))))
	'(org-hide ((t (:foreground "#5B3C11"))))
	'(org-latex-and-export-specials ((t (:foreground "#5B3C11"))))
	'(org-level-1 ((t (:foreground "#5B3C11"))))
	'(org-level-2 ((t (:foreground "#5B3C11"))))
	'(org-level-3 ((t (:foreground "#5B3C11"))))
	'(org-level-4 ((t (:foreground "#5B3C11"))))
	'(org-level-5 ((t (:foreground "#5B3C11"))))
	'(org-level-6 ((t (:foreground "#5B3C11"))))
	'(org-level-7 ((t (:foreground "#5B3C11"))))
	'(org-level-8 ((t (:foreground "#5B3C11"))))
	'(org-link ((t (:underline t :foreground "#5B3C11" :underline t))))
	'(org-mode-line-clock  ((t (:foreground "#5B3C11" :underline t))))
	'(org-scheduled-previously ((t (:foreground "#5B3C11"))))
	'(org-scheduled-today ((t (:foreground "#5B3C11"))))
	'(org-sexp-date ((t (:foreground "#5B3C11"))))
	'(org-special-keyword ((t (:foreground "#5B3C11"))))
	'(org-table ((t (:foreground "#5B3C11"))))
	'(org-tag ((t (:bold t :weight bold))))
	'(org-target ((t (:underline t))))
	'(org-time-grid ((t (:foreground "#5B3C11"))))
	'(org-todo ((t (:bold t :foreground "#5B3C11" :weight bold))))
	'(org-upcoming-deadline ((t (:foreground "#5B3C11"))))
	'(org-verbatim ((t (:foreground "#5B3C11" :underline nil))))
	'(org-warning ((t (:bold t :weight bold :foreground "#5B3C11"))))

	'(outline-1 ((t (:foreground "#5B3C11"))))
	'(outline-2 ((t (:foreground "#5B3C11"))))
	'(outline-3 ((t (:foreground "#5B3C11"))))
	'(outline-4 ((t (:foreground "#5B3C11"))))
	'(outline-5 ((t (:foreground "#5B3C11"))))
	'(outline-6 ((t (:foreground "#5B3C11"))))
	'(outline-7 ((t (:foreground "#5B3C11"))))
	'(outline-8 ((t (:foreground "#5B3C11"))))

;; * Courriel

	'(mu4e-header-face ((t (:background "black" :foreground "#5B3C11" :italic t))))
	'(mu4e-header-key-face ((t (:background "black" :foreground "#872E30"))))
	'(mu4e-region-code ((t (:background "black" :foreground "#5B3C11"))))

;; * Ivy

'(ivy-current-match ((t (:bold t :background "#5B3C11" :foreground "black"))))

;'(ivy-minibuffer-match-face-1 ((t (:bold t :background "#5B3C11" :foreground "black"))))
;'(ivy-minibuffer-match-face-2 ((t (:bold t :background "#5B3C11" :foreground "black"))))
;'(ivy-minibuffer-match-face-3 ((t (:bold t :background "#5B3C11" :foreground "black"))))
;'(ivy-minibuffer-match-face-4 ((t (:bold t :background "#5B3C11" :foreground "black"))))

'(ivy-minibuffer-match-face-1 ((t (:bold :background "black" :foreground "#5B3C11"))))
'(ivy-minibuffer-match-face-2 ((t (:bold :background "black" :foreground "#5B3C11"))))
'(ivy-minibuffer-match-face-3 ((t (:bold :background "black" :foreground "#5B3C11"))))
'(ivy-minibuffer-match-face-4 ((t (:bold :background "black" :foreground "#5B3C11"))))

;; * Helm

	'(helm-source-header ((t (:bold t :height 1.2 :background "#070707" :foreground "#5B3C11"))))

	'(helm-selection ((t (:bold t :background "#5B3C11" :foreground "black"))))
	'(helm-selection-line ((t (:bold t :background "#5B3C11" :foreground "black"))))

	'(helm-match ((t (:bold nil :background "black" :foreground "#872E30"))))
	'(helm-grep-match ((t (:bold nil :background "black" :foreground "#872E30"))))

	'(helm-visible-mark ((t (:background "black" :foreground "#872E30"))))

	'(helm-separator ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-bookmark-addressbook ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-bookmark-directory ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-bookmark-file ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-bookmark-gnus ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-bookmark-info ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-bookmark-man ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-bookmark-w3m ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-bookmark-w3m ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-buffer-not-saved ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-buffer-process ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-buffer-saved-out ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-buffer-size ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-buffer-saved-out ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-moccur-bufer ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-candidate-number ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-ff-directory ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-ff-executable ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-ff-file ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-ff-invalid-symlink ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-ff-prefix ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-ff-symlink ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-M-x-key ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-etags-file ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-grep-cmd-line ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-grep-file ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-grep-finish ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-grep-lineno ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-grep-running ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-buffer-directory ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-ff-dotted-directory ((t (:background "black" :foreground "#5B3C11"))))
	'(helm-ff-dotted-symlink-directory ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-history-remote ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-moccur-buffer ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-prefarg ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-locate-finish ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-header-line-left-margin ((t (:background "black" :foreground "#5B3C11"))))

	'(helm-swoop-target-line-face ((t (:bold t :background "#5B3C11" :foreground "black"))))
	'(helm-swoop-target-line-block-face ((t (:bold t :background "black" :foreground "#872E30"))))
	'(helm-swoop-target-word-face ((t (:bold t :background "black" :foreground  "#872E30"))))

;; * Undo-tree

	'(undo-tree-visualizer-default-face ((t (:background "black" :foreground "#5B3C11"))))
	'(undo-tree-visualizer-unmodified-face ((t (:background "black" :foreground "#5B3C11"))))
	'(undo-tree-visualizer-current-face ((t (:bold t :underline nil :background "black" :foreground "darkred"))))
	'(undo-tree-visualizer-register-face ((t (:background "black" :foreground "#5B3C11"))))
	'(undo-tree-visualizer-active-branch-face ((t (:bold t :background "black" :foreground "#754321"))))

;; * MTorus

	'(mtorus-highlight-face ((t (:background "black" :foreground "#5B3C11"))))

;; * Elscreen

	'(elscreen-tab-background-face ((t (:background "black" :foreground "#5B3C11"))))
	'(elscreen-tab-control-face ((t (:background "black" :foreground "#5B3C11"))))
	'(elscreen-tab-current-screen-face ((t (:background "black" :foreground "#5B3C11"))))
	'(elscreen-tab-other-screen-face ((t (:background "black" :foreground "#5B3C11"))))

;; * Company

	'(company-scrollbar-fg ((t (:background "black" :foreground "#5B3C11"))))
	'(company-scrollbar-bg ((t (:background "black" :foreground "#5B3C11"))))
	'(company-template-field ((t (:background "black" :foreground "#5B3C11"))))
	'(company-tooltip ((t (:background "black" :foreground "#5B3C11"))))
	'(company-tooltip-selection ((t (:background "#5b3c11" :foreground "black"))))
	'(company-tooltip-common ((t (:background "black" :foreground "#5B3C11"))))
	'(company-tooltip-common-selection ((t (:background "black" :foreground "#5B3C11"))))
	'(company-preview ((t (:background "black" :foreground "#5B3C11"))))
	'(company-preview-common ((t (:background "#5b3c11" :foreground "black"))))
	'(company-preview-search ((t (:background "black" :foreground "#5B3C11"))))

;; Easy Gnupg Assistant

	'(epa-field-body ((t (:background "black" :foreground "#5B3C11"))))
	'(epa-field-name ((t (:background "black" :foreground "#5B3C11"))))
	'(epa-string ((t (:background "black" :foreground "#5B3C11"))))
	'(epa-validity-high ((t (:background "black" :foreground "#5B3C11"))))
	'(epa-validity-medium ((t (:background "black" :foreground "#5B3C11"))))
	'(epa-validity-low ((t (:background "black" :foreground "#5B3C11"))))

;; Composition de mail

	'(message-header-name ((t (:background "black" :foreground "#5B3C11"))))
	'(message-header-to ((t (:background "black" :foreground "#5B3C11"))))
	'(message-header-subject ((t (:background "black" :foreground "#5B3C11"))))
	'(message-header-other ((t (:background "black" :foreground "#5B3C11"))))
	'(message-separator ((t (:background "black" :foreground "#754321"))))
	'(message-cited-text ((t (:background "black" :foreground "#872e30"))))

;; Gnus

	'(gnus-server-agent ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-server-closed ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-server-cloud ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-server-cloud-host ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-server-denied ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-server-offline ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-server-opened ((t (:background "black" :foreground "#5b3c11"))))

	'(gnus-group-mail-1 ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-mail-1-empty ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-mail-2 ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-mail-2-empty ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-mail-3 ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-mail-3-empty ((t (:background "black" :foreground "#5b3c11"))))

	'(gnus-group-news-1 ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-news-1-empty ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-news-2 ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-news-2-empty ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-news-3 ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-group-news-3-empty ((t (:background "black" :foreground "#5b3c11"))))

	'(gnus-header-from ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-header-name ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-header-subject ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-header-newsgroups ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-header-content ((t (:background "black" :foreground "#5b3c11"))))

	'(gnus-summary-high-undownloaded ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-summary-normal-undownloaded ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-summary-low-undownloaded ((t (:background "black" :foreground "#5b3c11"))))

	'(gnus-summary-high-unread ((t (:background "black" :foreground "#5b3c11" :italic t))))
	'(gnus-summary-normal-unread ((t (:background "black" :foreground "#5b3c11" :italic t))))
	'(gnus-summary-low-unread ((t (:background "black" :foreground "#5b3c11" :italic t))))

	'(gnus-summary-high-read ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-summary-normal-read ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-summary-low-read ((t (:background "black" :foreground "#5b3c11"))))

	'(gnus-summary-high-ticked ((t (:background "black" :foreground "#872e30"))))
	'(gnus-summary-normal-ticked ((t (:background "black" :foreground "#872e30"))))
	'(gnus-summary-low-ticked ((t (:background "black" :foreground "#872e30"))))

	'(gnus-summary-high-ancient ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-summary-normal-ancient ((t (:background "black" :foreground "#5b3c11"))))
	'(gnus-summary-low-ancient ((t (:background "black" :foreground "#5b3c11"))))

	'(gnus-cite-1 ((t (:background "black" :foreground "#872e30"))))
	'(gnus-cite-2 ((t (:background "black" :foreground "#5B3C11"))))
	'(gnus-cite-3 ((t (:background "black" :foreground "#872e30"))))
	'(gnus-cite-4 ((t (:background "black" :foreground "#5B3C11"))))
	'(gnus-cite-5 ((t (:background "black" :foreground "#872e30"))))
	'(gnus-cite-6 ((t (:background "black" :foreground "#5B3C11"))))
	'(gnus-cite-7 ((t (:background "black" :foreground "#872e30"))))
	'(gnus-cite-8 ((t (:background "black" :foreground "#5B3C11"))))
	'(gnus-cite-9 ((t (:background "black" :foreground "#872e30"))))
	'(gnus-cite-10 ((t (:background "black" :foreground "#5B3C11"))))
	'(gnus-cite-1 ((t (:background "black" :foreground "#872e30"))))

;; Fin du thème

)


(provide-theme 'golden-night-gui)
