;;; -*- mode: emacs-lisp -*-

;;; * Gestionnaire de paquets elpaca

(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "~/racine/plugin/manager/emacs/elpaca/"))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;;; * Liste de paquets à installer

(elpaca async)
(elpaca company)
(elpaca counsel-projectile)
(elpaca dash)
(elpaca evil)
(elpaca evil-leader)
(elpaca helm)
(elpaca helm-org)
(elpaca helm-projectile)
(elpaca hydra)
(elpaca ivy-rich)
(elpaca ibuffer-vc)
(elpaca key-chord)
(elpaca multiple-cursors)
(elpaca org-modern)
(elpaca outline-magic)
(elpaca powerline-evil)
(elpaca projectile)
(elpaca register-list)
(elpaca rg)
(elpaca smartparens)
(elpaca queue)
(elpaca region-bindings-mode)
(elpaca savekill)
(elpaca swiper) ;; ivy, counsel, swiper
(elpaca swiper-helm)
(elpaca switch-window)
(elpaca toc-org)
(elpaca undo-tree)
(elpaca wgrep)
(elpaca which-key)
(elpaca yasnippet)
(elpaca yasnippet-snippets)

(elpaca (dired-hacks :type git :host github :repo "Fuco1/dired-hacks"))
(elpaca (xah-math-input :type git :host github :repo "egisatoshi/xah-math-input"))

;; ** Block until current queue processed.

(elpaca-wait)

;;; * Use-package support

;; Enable use-package :ensure support for Elpaca.

;;(elpaca elpaca-use-package (elpaca-use-package-mode))

;; Turns off elpaca-use-package-mode current declaration
;; Note this will cause evaluate the declaration immediately. It is not deferred.
;; Useful for configuring built-in emacs features.

;;(use-package emacs :ensure nil :config (setq ring-bell-function #'ignore))

;;; * Provide

(provide 'personnel/paquets-elpaca)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
