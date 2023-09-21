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
(setq straight-use-package-by-default t)

;; (setq straight-check-for-modifications '(watch-files find-when-checking))

;;; ** Liste de paquets installés

;;; *** Nécessaire pour les déclarations & configurations de plugins

(straight-use-package 'use-package)

;; Doesn’t seem to work
(straight-use-package 'use-package-hydra)

;;; *** Nécessaires pour d’autres paquets

(straight-use-package 'async)
(straight-use-package 'dash-functional)
(straight-use-package 'f)
(straight-use-package 's)
(straight-use-package 'transient)

;;; *** Paquets Personnels

(straight-use-package '(duo :type git :host github :repo "chimay/duo"))
(straight-use-package '(torus :type git :host github :branch "version-2" :repo "chimay/torus"))

;;; *** Recettes

(straight-use-package '(emacs-mini-frame :type git :host github :repo "muffinmad/emacs-mini-frame"))
(straight-use-package '(eval-in-repl :type git :host github :repo "kaz-yos/eval-in-repl"))
(straight-use-package '(mini-frame :type git :host github :repo "muffinmad/emacs-mini-frame"))
(straight-use-package '(org-graph-view :type git :host github :repo "alphapapa/org-graph-view"))
(straight-use-package '(org-wild-notifier :type git :host github :repo "akhramov/org-wild-notifier.el"))
(straight-use-package '(ox-twbs :type git :host github :repo "marsmining/ox-twbs"))
(straight-use-package '(xah-math-input :type git :host github :repo "xahlee/xah-math-input"))

;;; *** Liste principale

(straight-use-package 'alert)
(straight-use-package 'auto-mark)
(straight-use-package 'auto-yasnippet)
(straight-use-package 'company)
(straight-use-package 'counsel-projectile)
(straight-use-package 'dired-hacks)
(straight-use-package 'evil)
(straight-use-package 'evil-leader)
(straight-use-package 'evil-org)
(straight-use-package 'flycheck)
(straight-use-package 'helm)
(straight-use-package 'helm-gtags)
(straight-use-package 'helm-projectile)
(straight-use-package 'helm-swoop)
(straight-use-package 'htmlize)
(straight-use-package 'hydra)
(straight-use-package 'ibuffer-vc)
(straight-use-package 'iy-go-to-char)
(straight-use-package 'key-chord)
(straight-use-package 'linum-relative)
(straight-use-package 'magit)
(straight-use-package 'multiple-cursors)
(straight-use-package 'org)
(straight-use-package 'org-alert)
(straight-use-package 'org-bullets)
(straight-use-package 'outline-magic)
(straight-use-package 'ox-pandoc)
(straight-use-package 'package-lint)
(straight-use-package 'powerline)
(straight-use-package 'powerline-evil)
(straight-use-package 'pretty-mode)
(straight-use-package 'projectile)
(straight-use-package 'region-bindings-mode)
(straight-use-package 'register-list)
(straight-use-package 'rg)
(straight-use-package 'savekill)
(straight-use-package 'smartparens)
(straight-use-package 'swiper)
(straight-use-package 'swiper-helm)
(straight-use-package 'switch-window)
(straight-use-package 'toc-org)
(straight-use-package 'ucs-cmds)
(straight-use-package 'undo-tree)
(straight-use-package 'wgrep)
(straight-use-package 'which-key)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)

;;; * Provide

(provide 'personnel/paquets-straight)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
