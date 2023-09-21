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

	'(default ((t (:background nil :foreground nil))))

	'(italic ((t (:italic t))))
	'(bold ((t (:bold t :weight bold))))

	'(bold-italic ((t (:bold t :italic t :slant italic :weight bold))))

	'(border ((t (:background "gold" :foreground "black" ))))

	'(cursor ((t (:background "yellow"))))

	'(border ((t (:background nil :foreground nil))))

	'(buffer-menu-buffer ((t (:bold t :weight bold))))

	'(link ((t (:underline t :background nil :foreground nil ))))

	'(button ((t (:underline t :background nil :foreground nil))))

	'(excerpt ((t (:italic t))))

	'(success ((t (:background nil :foreground nil))))

;; * Texte

	'(match ((t (:bold t :background nil :foreground "black"))))

	'(region ((t (:bold t :background nil :foreground "black"))))

	'(cua-rectangle ((t (:bold t :background nil :foreground "black"))))

	'(secondary-selection ((t (:italic t :background nil :foreground "black"))))

	'(header-line ((t (:bold t :background nil :foreground nil))))

;; * Highlight

	'(highlight ((t (:background nil))))
	'(hl-line ((t (:background nil))))

;; * Parenthèses

	'(show-paren-match ((t (:bold t :background nil :foreground "darkred"))))
	'(show-paren-match-face ((t (:bold t :background nil :foreground "darkred"))))
	'(show-paren-mismatch ((t (:underline t :bold t :background nil :foreground "darkred"))))

	'(paren-blink-off ((t (:foreground "black"))))
	'(paren-mismatch-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))
	'(paren-no-match-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))

;; * Marge

	'(linum ((t (:background nil :foreground "darkgreen"))))
	'(fringe ((t (:background "#070707" :foreground nil))))

;; * Supra

	'(tool-bar ((t (:background nil :foreground nil))))
	'(tooltip ((t (:background nil :foreground nil))))

	'(widget-field ((t (:background nil :foreground nil))))
	'(widget-single-line-field ((t (:background nil :foreground nil))))
	'(widget-documentation ((t (:background nil :foreground nil))))

;; * Infra

;; * Modeline

	'(mode-line ((t (
		:background nil :foreground nil :inverse-video t
		:box '(:line-width -1 :style released-button)
		:height 1.0
	))))

	'(mode-line-buffer-id ((t (
		:background "#070707" :foreground nil
		:bold t :weight bold :height 0.9
	))))

	'(mode-line-inactive ((t (:foreground nil :background "#070707"))))

	'(mode-line-emphasis ((t (:bold t :weight bold))))

	'(mode-line-highlight ((t (
		:box (:line-width 2 :color nil
		:style released-button :height 0.9
	)))))

	'(mode-line-inactive ((t (
		:background "#070707" :foreground nil
		:box '(:line-width -1 :color nil)
		:weight light :height 0.9
	))))

;; * Minibuffer

	'(minibuffer-prompt ((t (:foreground nil :height 1.0))))

;; * Font-lock

	'(font-lock-builtin-face       ((t (:foreground nil))))
	'(font-lock-constant-face      ((t (:foreground nil :bold t))))
	'(font-lock-preprocessor-face  ((t (:foreground nil :italic t))))
	'(font-lock-keyword-face       ((t (:foreground nil))))
	'(font-lock-type-face          ((t (:foreground nil))))
	'(font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
	'(font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
	'(font-lock-variable-name-face ((t (:foreground nil))))
	'(font-lock-function-name-face ((t (:foreground nil :weight bold :height 1.1))))
	'(font-lock-string-face        ((t (:foreground nil))))
	'(font-lock-comment-face       ((t (:italic t :slant oblique :foreground nil))))
	'(font-lock-comment-delimiter-face ((t (:foreground nil))))
	'(font-lock-doc-face           ((t (:italic t :slant oblique :foreground nil))))
	'(font-lock-doc-string-face    ((t (:foreground nil))))
	'(font-lock-warning-face ((t (:bold t :foreground nil :weight bold))))

;; * Info

	'(info-xref ((t (:underline t :weight normal :background nil :foreground nil))))
	'(info-xref-visited ((t (:underline t :background nil :foreground nil))))

	'(info-menu-5 ((t (:underline t))))
	'(info-menu-header ((t (:bold t :weight bold))))
	'(info-node ((t (:bold t :italic t :foreground nil))))
	'(info-node ((t (:italic t :bold t :foreground nil :slant italic :weight bold))))
	'(info-xref ((t (:bold t :foreground nil))))
	'(info-xref ((t (:bold t :foreground nil :weight bold))))

;; * Compilation

	'(compilation-column-number ((t (:foreground nil))))
	'(compilation-error ((t (:bold t :weight bold :foreground nil))))
	'(compilation-info ((t (:bold t :foreground nil :weight bold))))
	'(compilation-line-number ((t (:foreground nil))))
	'(compilation-message-face  ((t (:underline t))))
	'(compilation-warning ((t (:bold t :foreground nil :weight bold))))
	'(compilation-warning-face ((t (:bold t :foreground nil :weight bold))))
	'(compilation-mode-line-exit ((t (:foreground nil))))

	'(completions-common-part ((t (
		:width normal :height 1.0
		:weight normal :slant normal
		:foreground nil
	))))

;; * Custom

	'(custom-link ((t (:underline t :background nil :foreground nil))))
	'(custom-button ((t (:border nil :background nil :foreground nil))))
	'(custom-set ((t (:background nil :foreground nil))))
	'(custom-themed ((t (:background nil :foreground nil))))

	'(custom-button-face ((t (
		:background nil :foreground nil
		:box '(:line-width 2 :style released-button)
	))))

	'(custom-button-pressed ((t (:border nil :background nil :foreground nil))))
	'(custom-button-pressed-face ((t (:background nil :foreground nil :box '(:line-width 2 :style pressed-button)))))
	'(custom-button-pressed-unraised ((t (:border nil :background nil :foreground nil))))
	'(custom-button-unraised ((t (:border nil :background nil :foreground nil))))
	'(custom-button-mouse ((t (:border nil :background nil :foreground nil))))

	'(custom-changed-face ((t (:foreground nil))))
	'(custom-comment ((t (:background nil))))
	'(custom-comment-face ((t (:background nil))))
	'(custom-comment-tag-face ((t (:foreground nil))))
	'(custom-face-tag-face ((t (:bold t :weight bold :height 1.1))))
	'(custom-group-tag-face ((t (:bold t :foreground nil :weight bold :height 1.1))))
	'(custom-group-tag-face-1 ((t (:bold t :foreground nil :weight bold :height 1.1))))
	'(custom-invalid-face ((t (:background nil :foreground nil))))
	'(custom-modified-face ((t (:background nil :foreground nil))))
	'(custom-rogue-face ((t (:background nil :foreground nil))))
	'(custom-saved-face ((t (:underline t))))
	'(custom-set-face ((t (:background nil :foreground nil))))
	'(custom-state ((t (:foreground nil))))
	'(custom-state-face ((t (:foreground nil))))

	'(custom-variable-button-face ((t (
		:bold t :underline t :weight bold
		:background nil :foreground nil
		:box '(:line-width 2 :style released-button)
	))))

	'(custom-variable-tag-face ((t (:bold t :foreground nil :weight bold :height 1.2))))

;; * Isearch

	'(isearch ((t (:background nil :foreground nil))))
	'(isearch-fail ((t (:background nil :foreground "darkred"))))
	'(isearch-lazy-highlight-face ((t (:background nil))))
	'(isearch-secondary ((t (:foreground nil))))

;; * Popup

	'(popup-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-menu-face ((t (:background "#070707" :foreground "#88421D"))))
	'(popup-menu-summary-face ((t (:background "#070707" :foreground "#88421D"))))
	'(popup-menu-selection-face ((t (:background nil :foreground "black"))))

	'(popup-scroll-bar-background-face ((t (:background nil))))
	'(popup-scroll-bar-foreground-face ((t (:background "color-237"))))

	'(popup-tip-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-menu-mouse-face ((t (:background "#070707" :foreground "#88421D"))))

	'(popup-isearch-match ((t (:background nil :foreground "black"))))

;; * Eshell

	'(eshell-prompt ((t (:bold nil :background nil :foreground nil))))

	'(eshell-ls-archive ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-backup ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-clutter ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-directory ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-executable ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-missing ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-product ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-readonly ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-special ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-symlink ((t (:bold nil :background nil :foreground nil))))
	'(eshell-ls-unreadable ((t (:bold nil :background nil :foreground nil))))
	'(eshell-test-failed-face ((t (:bold nil :background nil :foreground nil))))
	'(eshell-test-ok-face ((t (:bold nil :background nil :foreground nil))))

;; * Org

	'(org-agenda-date ((t (:foreground nil))))
	'(org-agenda-date-weekend ((t (:bold t :foreground nil :weight bold))))
	'(org-agenda-restriction-lock ((t (:background "skyblue4"))))
	'(org-agenda-structure ((t (:foreground nil))))
	'(org-archived ((t (:foreground nil))))
	'(org-code ((t (:foreground nil))))
	'(org-column ((t (:background "grey30" :slant normal :weight normal :height 81))))
	'(org-column-title ((t (:bold t :background "grey30" :underline t :weight bold))))
	'(org-date ((t (:foreground nil :underline t))))
	'(org-done ((t (:bold t :foreground nil :weight bold))))
	'(org-drawer ((t (:foreground nil))))
	'(org-ellipsis ((t (:foreground nil :underline t))))
	'(org-formula ((t (:foreground nil))))
	'(org-headline-done ((t (:foreground nil))))
	'(org-hide ((t (:foreground nil))))
	'(org-latex-and-export-specials ((t (:foreground nil))))
	'(org-level-1 ((t (:foreground nil))))
	'(org-level-2 ((t (:foreground nil))))
	'(org-level-3 ((t (:foreground nil))))
	'(org-level-4 ((t (:foreground nil))))
	'(org-level-5 ((t (:foreground nil))))
	'(org-level-6 ((t (:foreground nil))))
	'(org-level-7 ((t (:foreground nil))))
	'(org-level-8 ((t (:foreground nil))))
	'(org-link ((t (:underline t :foreground nil :underline t))))
	'(org-mode-line-clock  ((t (:foreground nil :underline t))))
	'(org-scheduled-previously ((t (:foreground nil))))
	'(org-scheduled-today ((t (:foreground nil))))
	'(org-sexp-date ((t (:foreground nil))))
	'(org-special-keyword ((t (:foreground nil))))
	'(org-table ((t (:foreground nil))))
	'(org-tag ((t (:bold t :weight bold))))
	'(org-target ((t (:underline t))))
	'(org-time-grid ((t (:foreground nil))))
	'(org-todo ((t (:bold t :foreground nil :weight bold))))
	'(org-upcoming-deadline ((t (:foreground nil))))
	'(org-verbatim ((t (:foreground nil :underline t))))
	'(org-warning ((t (:bold t :weight bold :foreground nil))))

	'(outline-1 ((t (:foreground nil))))
	'(outline-2 ((t (:foreground nil))))
	'(outline-3 ((t (:foreground nil))))
	'(outline-4 ((t (:foreground nil))))
	'(outline-5 ((t (:foreground nil))))
	'(outline-6 ((t (:foreground nil))))
	'(outline-7 ((t (:foreground nil))))
	'(outline-8 ((t (:foreground nil))))

;; * Ivy

'(ivy-current-match ((t (:background nil :foreground "darkred"))))

'(ivy-subdir ((t (:bold nil :background nil :foreground nil))))

'(ivy-minibuffer-match-face-1 ((t (:bold nil :background nil :foreground nil))))
'(ivy-minibuffer-match-face-2 ((t (:bold nil :background nil :foreground nil))))
'(ivy-minibuffer-match-face-3 ((t (:bold nil :background nil :foreground nil))))
'(ivy-minibuffer-match-face-4 ((t (:bold nil :background nil :foreground nil))))

;; * Helm

	'(helm-source-header ((t (:bold t :height 1.2 :background "#070707" :foreground nil))))

	'(helm-selection ((t (:underline nil :bold t :background "#070707" :foreground nil))))
	'(helm-selection-line ((t (:underline nil :bold t :background "#070707" :foreground nil))))

	'(helm-match ((t (:bold nil :background nil :foreground nil))))
	'(helm-grep-match ((t (:bold nil :background nil :foreground nil))))

	'(helm-visible-mark ((t (:background nil :foreground "#872E30"))))

	'(helm-separator ((t (:background nil :foreground nil))))

	'(helm-bookmark-addressbook ((t (:background nil :foreground nil))))
	'(helm-bookmark-directory ((t (:background nil :foreground nil))))
	'(helm-bookmark-file ((t (:background nil :foreground nil))))
	'(helm-bookmark-gnus ((t (:background nil :foreground nil))))
	'(helm-bookmark-info ((t (:background nil :foreground nil))))
	'(helm-bookmark-man ((t (:background nil :foreground nil))))
	'(helm-bookmark-w3m ((t (:background nil :foreground nil))))
	'(helm-bookmark-w3m ((t (:background nil :foreground nil))))

	'(helm-buffer-not-saved ((t (:background nil :foreground nil))))
	'(helm-buffer-process ((t (:background nil :foreground nil))))
	'(helm-buffer-saved-out ((t (:background nil :foreground nil))))
	'(helm-buffer-size ((t (:background nil :foreground nil))))
	'(helm-buffer-saved-out ((t (:background nil :foreground nil))))

	'(helm-moccur-bufer ((t (:background nil :foreground nil))))

	'(helm-candidate-number ((t (:background nil :foreground nil))))

	'(helm-ff-directory ((t (:background nil :foreground nil))))
	'(helm-ff-executable ((t (:background nil :foreground nil))))
	'(helm-ff-file ((t (:background nil :foreground nil))))
	'(helm-ff-invalid-symlink ((t (:background nil :foreground nil))))
	'(helm-ff-prefix ((t (:background nil :foreground nil))))
	'(helm-ff-symlink ((t (:background nil :foreground nil))))

	'(helm-grep-cmd-line ((t (:background nil :foreground nil))))
	'(helm-grep-file ((t (:background nil :foreground nil))))
	'(helm-grep-finish ((t (:background nil :foreground nil))))
	'(helm-grep-lineno ((t (:background nil :foreground nil))))
	'(helm-grep-running ((t (:background nil :foreground nil))))

	'(helm-history-remote ((t (:background nil :foreground nil))))

;; * Undo-tree

	'(undo-tree-visualizer-default-face ((t (:background nil :foreground nil))))
	'(undo-tree-visualizer-unmodified-face ((t (:background nil :foreground nil))))
	'(undo-tree-visualizer-current-face ((t (:bold t :underline nil :background nil :foreground "darkred"))))
	'(undo-tree-visualizer-register-face ((t (:background nil :foreground nil))))
	'(undo-tree-visualizer-active-branch-face ((t (:background nil :foreground nil))))

)

(provide-theme 'golden-night-term)
