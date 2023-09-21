;;; -*- mode: emacs-lisp -*-

;;; * Gestionnaire de paquets elpaca

(defvar elpaca-installer-version 0.3)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (kill-buffer buffer)
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;;; ** Liste de paquets installés

;;; *** Nécessaire pour les déclarations & configurations de plugins

(elpaca use-package)

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;;; *** Nécessaires pour d’autres paquets

(elpaca async)
(elpaca dash-functional)
(elpaca f)
(elpaca s)
(elpaca transient)

;;; *** Paquets Personnels

(elpaca (duo :host github :repo "chimay/duo"))
(elpaca (torus :host github :repo "chimay/torus" :branch "version-2"))

;;; *** Recettes

(elpaca (emacs-mini-frame :type git :host github :repo "muffinmad/emacs-mini-frame"))
(elpaca (eval-in-repl :type git :host github :repo "kaz-yos/eval-in-repl"))
(elpaca (mini-frame :type git :host github :repo "muffinmad/emacs-mini-frame"))
(elpaca (org-graph-view :type git :host github :repo "alphapapa/org-graph-view"))
(elpaca (org-wild-notifier :type git :host github :repo "akhramov/org-wild-notifier.el"))
(elpaca (ox-twbs :type git :host github :repo "marsmining/ox-twbs"))
(elpaca (xah-math-input :type git :host github :repo "xahlee/xah-math-input"))

;;; *** Liste principale

;; Doesn’t seem to work
(elpaca use-package-hydra)

(elpaca alert)
(elpaca auto-mark)
(elpaca auto-yasnippet)
(elpaca company)
(elpaca counsel-projectile)
(elpaca dired-hacks)
(elpaca evil)
(elpaca evil-leader)
;;(elpaca evil-org)
(elpaca flycheck)
(elpaca helm)
(elpaca helm-gtags)
(elpaca helm-projectile)
(elpaca helm-swoop)
(elpaca htmlize)
(elpaca hydra)
(elpaca ibuffer-vc)
(elpaca iy-go-to-char)
(elpaca key-chord)
(elpaca linum-relative)
(elpaca magit)
(elpaca multiple-cursors)
(elpaca org)
(elpaca org-alert)
(elpaca org-bullets)
(elpaca outline-magic)
(elpaca ox-pandoc)
(elpaca package-lint)
(elpaca powerline)
(elpaca powerline-evil)
(elpaca pretty-mode)
(elpaca projectile)
(elpaca region-bindings-mode)
(elpaca register-list)
(elpaca rg)
(elpaca savekill)
(elpaca smartparens)
(elpaca swiper)
(elpaca swiper-helm)
(elpaca switch-window)
(elpaca toc-org)
(elpaca ucs-cmds)
(elpaca undo-tree)
(elpaca wgrep)
(elpaca which-key)
(elpaca yasnippet)
(elpaca yasnippet-snippets)

;; ** Block until current queue processed.

(elpaca-wait)

;;; * Provide

(provide 'personnel/paquets-elpaca)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
