; -*- lisp -*-

; Utiliser
;	M-x list-faces-display
; pour afficher les réglages courants
; et
;	M-x list-colors-display
; pour afficher les couleurs disponibles

(deftheme golden-night-term "Thème couleur sombre, version terminal.")

(custom-theme-set-faces 'golden-night-term

;; * Base

	'(default ((t (:background unspecified :foreground unspecified))))

	'(italic ((t (:italic t))))
	'(bold ((t (:bold t :weight bold))))

	'(bold-italic ((t (:bold t :italic t :slant italic :weight bold))))

	'(border ((t (:background "gold" :foreground "black" ))))

	'(cursor ((t (:background "yellow"))))

	'(border ((t (:background unspecified :foreground unspecified))))

	'(buffer-menu-buffer ((t (:bold t :weight bold))))

	'(link ((t (:underline t :background unspecified :foreground unspecified ))))

	'(button ((t (:underline t :background unspecified :foreground unspecified))))

	'(excerpt ((t (:italic t))))

	'(success ((t (:background unspecified :foreground unspecified))))

;; * Texte

	'(match ((t (:bold t :background unspecified :foreground "black"))))

	'(region ((t (:bold t :background unspecified :foreground "black"))))

	'(cua-rectangle ((t (:bold t :background unspecified :foreground "black"))))

	'(secondary-selection ((t (:italic t :background unspecified :foreground "black"))))

	'(header-line ((t (:bold t :background unspecified :foreground unspecified))))

;; * Highlight

	'(highlight ((t (:background unspecified))))
	'(hl-line ((t (:background unspecified))))

;; * Parenthèses

	'(show-paren-match ((t (:bold t :background unspecified :foreground "darkred"))))
	'(show-paren-match-face ((t (:bold t :background unspecified :foreground "darkred"))))
	'(show-paren-mismatch ((t (:underline t :bold t :background unspecified :foreground "darkred"))))

	'(paren-blink-off ((t (:foreground "black"))))
	'(paren-mismatch-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))
	'(paren-no-match-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))

;; * Marge

	'(linum ((t (:background unspecified :foreground "darkgreen"))))
	'(fringe ((t (:background "#070707" :foreground unspecified))))

;; * Supra

	'(tool-bar ((t (:background unspecified :foreground unspecified))))
	'(tooltip ((t (:background unspecified :foreground unspecified))))

	'(widget-field ((t (:background unspecified :foreground unspecified))))
	'(widget-single-line-field ((t (:background unspecified :foreground unspecified))))
	'(widget-documentation ((t (:background unspecified :foreground unspecified))))

;; * Infra

;; * Modeline

	'(mode-line ((t (
		:background unspecified :foreground unspecified :inverse-video t
		:height 1.0
	))))

	'(mode-line-buffer-id ((t (
		:background "#070707" :foreground unspecified
		:bold t :weight bold :height 0.9
	))))

	'(mode-line-inactive ((t (:foreground unspecified :background "#070707"))))

	'(mode-line-emphasis ((t (:bold t :weight bold))))

	'(mode-line-highlight ((t (
		:box (:line-width 2 :color nil
	)))))

	'(mode-line-inactive ((t (
		:background "#070707" :foreground unspecified
		:weight light :height 0.9
	))))

;; * Minibuffer

	'(minibuffer-prompt ((t (:foreground unspecified :height 1.0))))

;; * Font-lock

	'(font-lock-builtin-face       ((t (:foreground unspecified))))
	'(font-lock-constant-face      ((t (:foreground unspecified :bold t))))
	'(font-lock-preprocessor-face  ((t (:foreground unspecified :italic t))))
	'(font-lock-keyword-face       ((t (:foreground unspecified))))
	'(font-lock-type-face          ((t (:foreground unspecified))))
	'(font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
	'(font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
	'(font-lock-variable-name-face ((t (:foreground unspecified))))
	'(font-lock-function-name-face ((t (:foreground unspecified :weight bold :height 1.1))))
	'(font-lock-string-face        ((t (:foreground unspecified))))
	'(font-lock-comment-face       ((t (:italic t :slant oblique :foreground unspecified))))
	'(font-lock-comment-delimiter-face ((t (:foreground unspecified))))
	'(font-lock-doc-face           ((t (:italic t :slant oblique :foreground unspecified))))
	'(font-lock-doc-string-face    ((t (:foreground unspecified))))
	'(font-lock-warning-face ((t (:bold t :foreground unspecified :weight bold))))

;; * Info

	'(info-xref ((t (:underline t :weight normal :background unspecified :foreground unspecified))))
	'(info-xref-visited ((t (:underline t :background unspecified :foreground unspecified))))

	'(info-menu-5 ((t (:underline t))))
	'(info-menu-header ((t (:bold t :weight bold))))
	'(info-node ((t (:bold t :italic t :foreground unspecified))))
	'(info-node ((t (:italic t :bold t :foreground unspecified :slant italic :weight bold))))
	'(info-xref ((t (:bold t :foreground unspecified))))
	'(info-xref ((t (:bold t :foreground unspecified :weight bold))))

;; * Compilation

	'(compilation-column-number ((t (:foreground unspecified))))
	'(compilation-error ((t (:bold t :weight bold :foreground unspecified))))
	'(compilation-info ((t (:bold t :foreground unspecified :weight bold))))
	'(compilation-line-number ((t (:foreground unspecified))))
	'(compilation-message-face  ((t (:underline t))))
	'(compilation-warning ((t (:bold t :foreground unspecified :weight bold))))
	'(compilation-warning-face ((t (:bold t :foreground unspecified :weight bold))))
	'(compilation-mode-line-exit ((t (:foreground unspecified))))

	'(completions-common-part ((t (
		:width normal :height 1.0
		:weight normal :slant normal
		:foreground unspecified
	))))

;; * Custom

	'(custom-link ((t (:underline t :background unspecified :foreground unspecified))))
	'(custom-button ((t (:border nil :background unspecified :foreground unspecified))))
	'(custom-set ((t (:background unspecified :foreground unspecified))))
	'(custom-themed ((t (:background unspecified :foreground unspecified))))

	'(custom-button-face ((t (
		:background unspecified :foreground unspecified
	))))

	'(custom-button-pressed ((t (:border nil :background unspecified :foreground unspecified))))
	'(custom-button-pressed-face ((t (:background unspecified :foreground unspecified :box '(:line-width 2 :style pressed-button)))))
	'(custom-button-pressed-unraised ((t (:border nil :background unspecified :foreground unspecified))))
	'(custom-button-unraised ((t (:border nil :background unspecified :foreground unspecified))))
	'(custom-button-mouse ((t (:border nil :background unspecified :foreground unspecified))))

	'(custom-changed-face ((t (:foreground unspecified))))
	'(custom-comment ((t (:background unspecified))))
	'(custom-comment-face ((t (:background unspecified))))
	'(custom-comment-tag-face ((t (:foreground unspecified))))
	'(custom-face-tag-face ((t (:bold t :weight bold :height 1.1))))
	'(custom-group-tag-face ((t (:bold t :foreground unspecified :weight bold :height 1.1))))
	'(custom-group-tag-face-1 ((t (:bold t :foreground unspecified :weight bold :height 1.1))))
	'(custom-invalid-face ((t (:background unspecified :foreground unspecified))))
	'(custom-modified-face ((t (:background unspecified :foreground unspecified))))
	'(custom-rogue-face ((t (:background unspecified :foreground unspecified))))
	'(custom-saved-face ((t (:underline t))))
	'(custom-set-face ((t (:background unspecified :foreground unspecified))))
	'(custom-state ((t (:foreground unspecified))))
	'(custom-state-face ((t (:foreground unspecified))))

	'(custom-variable-button-face ((t (
		:bold t :underline t :weight bold
		:background unspecified :foreground unspecified
	))))

	'(custom-variable-tag-face ((t (:bold t :foreground unspecified :weight bold :height 1.2))))

;; * Isearch

	'(isearch ((t (:background unspecified :foreground unspecified))))
	'(isearch-fail ((t (:background unspecified :foreground "darkred"))))
	'(isearch-lazy-highlight-face ((t (:background unspecified))))
	'(isearch-secondary ((t (:foreground unspecified))))

;; * Popup

	'(popup-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-menu-face ((t (:background "#070707" :foreground "#88421D"))))
	'(popup-menu-summary-face ((t (:background "#070707" :foreground "#88421D"))))
	'(popup-menu-selection-face ((t (:background unspecified :foreground "black"))))

	'(popup-scroll-bar-background-face ((t (:background unspecified))))
	'(popup-scroll-bar-foreground-face ((t (:background "color-237"))))

	'(popup-tip-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-menu-mouse-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-isearch-match ((t (:background unspecified :foreground "black"))))

;; * Eshell

	'(eshell-prompt ((t (:bold nil :background unspecified :foreground unspecified))))

	'(eshell-ls-archive ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-backup ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-clutter ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-directory ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-executable ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-missing ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-product ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-readonly ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-special ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-symlink ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-ls-unreadable ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-test-failed-face ((t (:bold nil :background unspecified :foreground unspecified))))
	'(eshell-test-ok-face ((t (:bold nil :background unspecified :foreground unspecified))))

;; * Org

	'(org-agenda-date ((t (:foreground unspecified))))
	'(org-agenda-date-weekend ((t (:bold t :foreground unspecified :weight bold))))
	'(org-agenda-restriction-lock ((t (:background "skyblue4"))))
	'(org-agenda-structure ((t (:foreground unspecified))))
	'(org-archived ((t (:foreground unspecified))))
	'(org-code ((t (:foreground unspecified))))
	'(org-column ((t (:background "grey30" :slant normal :weight normal :height 81))))
	'(org-column-title ((t (:bold t :background "grey30" :underline t :weight bold))))
	'(org-date ((t (:foreground unspecified :underline t))))
	'(org-done ((t (:bold t :foreground unspecified :weight bold))))
	'(org-drawer ((t (:foreground unspecified))))
	'(org-ellipsis ((t (:foreground unspecified :underline t))))
	'(org-formula ((t (:foreground unspecified))))
	'(org-headline-done ((t (:foreground unspecified))))
	'(org-hide ((t (:foreground unspecified))))
	'(org-latex-and-export-specials ((t (:foreground unspecified))))
	'(org-level-1 ((t (:foreground unspecified))))
	'(org-level-2 ((t (:foreground unspecified))))
	'(org-level-3 ((t (:foreground unspecified))))
	'(org-level-4 ((t (:foreground unspecified))))
	'(org-level-5 ((t (:foreground unspecified))))
	'(org-level-6 ((t (:foreground unspecified))))
	'(org-level-7 ((t (:foreground unspecified))))
	'(org-level-8 ((t (:foreground unspecified))))
	'(org-link ((t (:underline t :foreground unspecified :underline t))))
	'(org-mode-line-clock  ((t (:foreground unspecified :underline t))))
	'(org-scheduled-previously ((t (:foreground unspecified))))
	'(org-scheduled-today ((t (:foreground unspecified))))
	'(org-sexp-date ((t (:foreground unspecified))))
	'(org-special-keyword ((t (:foreground unspecified))))
	'(org-table ((t (:foreground unspecified))))
	'(org-tag ((t (:bold t :weight bold))))
	'(org-target ((t (:underline t))))
	'(org-time-grid ((t (:foreground unspecified))))
	'(org-todo ((t (:bold t :foreground unspecified :weight bold))))
	'(org-upcoming-deadline ((t (:foreground unspecified))))
	'(org-verbatim ((t (:foreground unspecified :underline t))))
	'(org-warning ((t (:bold t :weight bold :foreground unspecified))))

	'(outline-1 ((t (:foreground unspecified))))
	'(outline-2 ((t (:foreground unspecified))))
	'(outline-3 ((t (:foreground unspecified))))
	'(outline-4 ((t (:foreground unspecified))))
	'(outline-5 ((t (:foreground unspecified))))
	'(outline-6 ((t (:foreground unspecified))))
	'(outline-7 ((t (:foreground unspecified))))
	'(outline-8 ((t (:foreground unspecified))))

;; * Ivy

'(ivy-current-match ((t (:background unspecified :foreground "darkred"))))

'(ivy-subdir ((t (:bold nil :background unspecified :foreground unspecified))))

'(ivy-minibuffer-match-face-1 ((t (:bold nil :background unspecified :foreground unspecified))))
'(ivy-minibuffer-match-face-2 ((t (:bold nil :background unspecified :foreground unspecified))))
'(ivy-minibuffer-match-face-3 ((t (:bold nil :background unspecified :foreground unspecified))))
'(ivy-minibuffer-match-face-4 ((t (:bold nil :background unspecified :foreground unspecified))))

;; * Helm

	'(helm-source-header ((t (:bold t :height 1.2 :background "#070707" :foreground unspecified))))

	'(helm-selection ((t (:underline nil :bold t :background "#070707" :foreground unspecified))))
	'(helm-selection-line ((t (:underline nil :bold t :background "#070707" :foreground unspecified))))

	'(helm-match ((t (:bold nil :background unspecified :foreground unspecified))))
	'(helm-grep-match ((t (:bold nil :background unspecified :foreground unspecified))))

	'(helm-visible-mark ((t (:background unspecified :foreground "#872E30"))))

	'(helm-separator ((t (:background unspecified :foreground unspecified))))

	'(helm-bookmark-addressbook ((t (:background unspecified :foreground unspecified))))
	'(helm-bookmark-directory ((t (:background unspecified :foreground unspecified))))
	'(helm-bookmark-file ((t (:background unspecified :foreground unspecified))))
	'(helm-bookmark-gnus ((t (:background unspecified :foreground unspecified))))
	'(helm-bookmark-info ((t (:background unspecified :foreground unspecified))))
	'(helm-bookmark-man ((t (:background unspecified :foreground unspecified))))
	'(helm-bookmark-w3m ((t (:background unspecified :foreground unspecified))))
	'(helm-bookmark-w3m ((t (:background unspecified :foreground unspecified))))

	'(helm-buffer-not-saved ((t (:background unspecified :foreground unspecified))))
	'(helm-buffer-process ((t (:background unspecified :foreground unspecified))))
	'(helm-buffer-saved-out ((t (:background unspecified :foreground unspecified))))
	'(helm-buffer-size ((t (:background unspecified :foreground unspecified))))
	'(helm-buffer-saved-out ((t (:background unspecified :foreground unspecified))))

	'(helm-moccur-bufer ((t (:background unspecified :foreground unspecified))))

	'(helm-candidate-number ((t (:background unspecified :foreground unspecified))))

	'(helm-ff-directory ((t (:background unspecified :foreground unspecified))))
	'(helm-ff-executable ((t (:background unspecified :foreground unspecified))))
	'(helm-ff-file ((t (:background unspecified :foreground unspecified))))
	'(helm-ff-invalid-symlink ((t (:background unspecified :foreground unspecified))))
	'(helm-ff-prefix ((t (:background unspecified :foreground unspecified))))
	'(helm-ff-symlink ((t (:background unspecified :foreground unspecified))))

	'(helm-grep-cmd-line ((t (:background unspecified :foreground unspecified))))
	'(helm-grep-file ((t (:background unspecified :foreground unspecified))))
	'(helm-grep-finish ((t (:background unspecified :foreground unspecified))))
	'(helm-grep-lineno ((t (:background unspecified :foreground unspecified))))
	'(helm-grep-running ((t (:background unspecified :foreground unspecified))))

	'(helm-history-remote ((t (:background unspecified :foreground unspecified))))

;; * Undo-tree

	'(undo-tree-visualizer-default-face ((t (:background unspecified :foreground unspecified))))
	'(undo-tree-visualizer-unmodified-face ((t (:background unspecified :foreground unspecified))))
	'(undo-tree-visualizer-current-face ((t (:bold t :underline nil :background unspecified :foreground "darkred"))))
	'(undo-tree-visualizer-register-face ((t (:background unspecified :foreground unspecified))))
	'(undo-tree-visualizer-active-branch-face ((t (:background unspecified :foreground unspecified))))

)

(provide-theme 'golden-night-term)
