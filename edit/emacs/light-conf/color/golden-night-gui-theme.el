; -*- lisp -*-

; Utiliser
;	M-x list-faces-display
; pour afficher les réglages courants
; et
;	M-x list-colors-display
; pour afficher les couleurs disponibles

(deftheme golden-night-gui "Golden night for gui emacs.")

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

	'(highlight ((t (:background nil :underline t))))
	'(hl-line ((t (:background "#120507" :underline nil))))

;; * Parenthèses

	'(show-paren-match ((t (:bold t :background "black" :foreground "darkred"))))
	'(show-paren-match-face ((t (:bold t :background "black" :foreground "darkred"))))
	'(show-paren-mismatch ((t (:underline t :bold t :background "black" :foreground "darkred"))))

	'(paren-blink-off ((t (:foreground "black"))))
	'(paren-mismatch-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))
	'(paren-no-match-face ((t (:underline t :bold t :background "#121212" :foreground "gold"))))

;; * Supra

	'(tool-bar ((t (:background "black" :foreground "#5B3C11"))))
	'(tooltip ((t (:background "black" :foreground "#5B3C11"))))

	'(widget-field ((t (:background "black" :foreground "#5B3C11"))))
	'(widget-single-line-field ((t (:background "black" :foreground "#5B3C11"))))
	'(widget-documentation ((t (:background "black" :foreground "#5B3C11"))))

;; * Infra

;; * Modeline

	'(mode-line-emphasis ((t (:bold t :weight bold))))

    '(mode-line ((t (
        :background nil :foreground nil :inverse-video t :bold t
        :height 1.0
    ))))

;; * Minibuffer

	'(minibuffer-prompt ((t (:foreground "#5B3C11" :height 1.0))))

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

;; Fin du thème

)


(provide-theme 'golden-night-gui)
