;;; -*- mode: emacs-lisp -*-

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
(el-get-bundle auctex)
(el-get-bundle auto-mark)
(el-get-bundle auto-yasnippet)
(el-get-bundle avy)
(el-get-bundle command-log-mode)
(el-get-bundle company-mode)
(el-get-bundle counsel-projectile)
(el-get-bundle dired-hacks)
(el-get-bundle emacs-async)
(el-get-bundle evil)
(el-get-bundle evil-leader)
(el-get-bundle expand-region)
(el-get-bundle flycheck)
(el-get-bundle ggtags)
(el-get-bundle helm)
(el-get-bundle helm-gtags)
(el-get-bundle helm-projectile)
(el-get-bundle helm-swoop)
(el-get-bundle htmlize)
(el-get-bundle hydra)
(el-get-bundle ibuffer-vc)
(el-get-bundle iy-go-to-char)
(el-get-bundle key-chord)
(el-get-bundle linum-relative)
(el-get-bundle multiple-cursors)
(el-get-bundle org-alert)
(el-get-bundle org-bullets)
(el-get-bundle org-mode)
(el-get-bundle org-publish)
(el-get-bundle outline-magic)
(el-get-bundle ox-pandoc)
(el-get-bundle package-lint)
(el-get-bundle powerline)
(el-get-bundle powerline-evil)
(el-get-bundle pretty-mode)
(el-get-bundle projectile)
(el-get-bundle region-bindings-mode)
(el-get-bundle register-list)
(el-get-bundle ruby-mode)
(el-get-bundle savekill)
(el-get-bundle smartparens)
(el-get-bundle swiper)
(el-get-bundle swiper-helm)
(el-get-bundle switch-window)
(el-get-bundle toc-org)
(el-get-bundle ucs-cmds)
(el-get-bundle undo-tree)
(el-get-bundle vimish-fold)
(el-get-bundle wgrep)
(el-get-bundle which-key)
(el-get-bundle yasnippet)
(el-get-bundle yasnippet-snippets)
(el-get-bundle ztree)

;;; *** Recettes personnelles

(el-get-bundle eval-in-repl)
(el-get-bundle evil-org-mode-somelauw)
(el-get-bundle org-wild-notifier)
(el-get-bundle ox-twbs)
(el-get-bundle xah-math-input)

;;; *** Paquets Personnels

(el-get-bundle torus)

;;; Sync

(el-get 'sync)

;;; * Gestionnaire de paquets natif

;; This must come before configurations of installed packages.

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;; ** Use-package

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;;; ** Liste de paquets

(unless (package-installed-p 'magit)
	(package-refresh-contents)
	(package-install 'magit))

;;; * Provide

(provide 'personnel/paquets)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
