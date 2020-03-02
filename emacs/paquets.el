;;; -*- mode: emacs-lisp -*-

;;; * Gestionnaire de paquets straight

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-check-for-modifications '(check-on-save find-when-checking))

;; (setq straight-check-for-modifications '(watch-files find-when-checking))

;;; ** Liste de paquets installés

(straight-use-package 'use-package)

(straight-use-package 'auto-yasnippet)
(straight-use-package 'auto-mark)
(straight-use-package 'dired-hacks)
(straight-use-package 'flycheck)
(straight-use-package 'htmlize)
(straight-use-package 'ibuffer-vc)
(straight-use-package 'iy-go-to-char)
(straight-use-package 'linum-relative)
(straight-use-package 'key-chord)
(straight-use-package 'magit)
(straight-use-package 'multiple-cursors)
(straight-use-package 'outline-magic)
(straight-use-package 'package-lint)
(straight-use-package 'pretty-mode)
(straight-use-package 'register-list)
(straight-use-package 'savekill)
(straight-use-package 'ucs-cmds)
(straight-use-package 'undo-tree)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'wgrep)
(straight-use-package 'which-key)

(straight-use-package '(emacs-mini-frame :type git :host github :repo "muffinmad/emacs-mini-frame"))
(straight-use-package '(eval-in-repl :type git :host github :repo "kaz-yos/eval-in-repl"))
(straight-use-package '(xah-math-input :type git :host github :repo "xahlee/xah-math-input"))

;;; * Gestionnaire de paquets el-get

(add-to-list 'load-path "~/racine/plugin/manager/el-get/el-get")

(setq el-get-dir "~/racine/plugin/manager/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-user-package-directory "~/racine/config/edit/emacs/pack")
(add-to-list 'el-get-recipe-path "~/racine/plugin/data/el-get-user/recipes")

;;; ** Bindings

(global-unset-key (kbd "<f12>"))

(define-prefix-command 'elget/map)

(global-set-key (kbd "<f12>") 'elget/map)

(define-key elget/map (kbd "h") 'el-get-describe)
(define-key elget/map (kbd "i") 'el-get-install)
(define-key elget/map (kbd "R") 'el-get-remove)
(define-key elget/map (kbd "s") 'el-get-self-update)
(define-key elget/map (kbd "u") 'el-get-update)
(define-key elget/map (kbd "U") 'el-get-update-all)
(define-key elget/map (kbd "r") 'el-get-reload)
(define-key elget/map (kbd "l") 'el-get-list-packages)
(define-key elget/map (kbd "f") 'el-get-find-recipe-file)

;;; ** Liste de paquets installés

;;; *** Nécessaire pour d’autres paquets

(el-get-bundle paredit)
(el-get-bundle ace-window)
(el-get-bundle ht)
(el-get-bundle htmlize)

;;; *** Langages

(el-get-bundle inf-perl)
(el-get-bundle inf-ruby)
(el-get-bundle python)

;;; *** Liste principale

(el-get-bundle alert)
(el-get-bundle company-mode)
(el-get-bundle counsel-projectile)
(el-get-bundle emacs-async)
(el-get-bundle evil)
(el-get-bundle evil-leader)
(el-get-bundle helm)
(el-get-bundle helm-gtags)
(el-get-bundle helm-projectile)
(el-get-bundle helm-swoop)
(el-get-bundle hydra)
(el-get-bundle org-alert)
(el-get-bundle org-bullets)
(el-get-bundle org-graph-view)
(el-get-bundle org-mode)
(el-get-bundle org-publish)
(el-get-bundle ox-pandoc)
(el-get-bundle powerline)
(el-get-bundle powerline-evil)
(el-get-bundle projectile)
(el-get-bundle region-bindings-mode)
(el-get-bundle smartparens)
(el-get-bundle swiper)
(el-get-bundle swiper-helm)
(el-get-bundle switch-window)
(el-get-bundle toc-org)

;;; *** Recettes personnelles

(el-get-bundle evil-org-mode-somelauw)
(el-get-bundle org-wild-notifier)
(el-get-bundle ox-twbs)

;;; *** Paquets Personnels

;; As dep
;; (el-get-bundle duo)

(el-get-bundle torus)

;;; Sync

(el-get 'sync)

;;; * Gestionnaire de paquets natif

;; This must come before configurations of installed packages.

(require 'package)

(package-initialize)
;; <- opposite ->
;;(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;; ** Use-package

;; (unless (package-installed-p 'use-package)
;; 	(package-refresh-contents)
;; 	(package-install 'use-package))

;;; ** Liste de paquets

;; (unless (package-installed-p 'magit)
;; 	(package-refresh-contents)
;; 	(package-install 'magit))

;;; * Provide

(provide 'personnel/paquets)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
