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
(define-key elget/map (kbd "$") 'el-get-self-update)
(define-key elget/map (kbd "u") 'el-get-update)
(define-key elget/map (kbd "U") 'el-get-update-all)
(define-key elget/map (kbd "r") 'el-get-reload)
(define-key elget/map (kbd "l") 'el-get-list-packages)
(define-key elget/map (kbd "f") 'el-get-find-recipe-file)

;;; ** Liste de paquets installés

;;; ** Sync

(el-get 'sync)

;;; * Provide

(provide 'personnel/paquets-el-get)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
