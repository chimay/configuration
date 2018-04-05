;; -*- mode: lisp -*-

;; * Liste de bundles

(el-get-bundle auto-mark)
(el-get-bundle avy)
(el-get-bundle buffer-ring)
(el-get-bundle command-log-mode)
(el-get-bundle counsel-projectile)
(el-get-bundle dired-hacks)
(el-get-bundle dynamic-ring)		; pour buffer-ring
(el-get-bundle emacs-async)
(el-get-bundle evil)
(el-get-bundle expand-region)
(el-get-bundle ggtags)
(el-get-bundle helm)
(el-get-bundle helm-ag)
(el-get-bundle helm-gtags)
(el-get-bundle helm-projectile)
(el-get-bundle helm-swoop)
(el-get-bundle hydra)
(el-get-bundle ibuffer-vc)
(el-get-bundle inf-perl)
(el-get-bundle inf-ruby)
(el-get-bundle iy-go-to-char)
(el-get-bundle key-chord)
(el-get-bundle linum-relative)
(el-get-bundle multiple-cursors)
(el-get-bundle org-bullets)
(el-get-bundle org-mode)
(el-get-bundle outline-magic)
(el-get-bundle projectile)
(el-get-bundle region-bindings-mode)
(el-get-bundle register-list)
(el-get-bundle savekill)
(el-get-bundle smartparens)
(el-get-bundle swiper)
(el-get-bundle swiper-helm)
(el-get-bundle ucs-cmds)
(el-get-bundle undo-tree)
(el-get-bundle vimish-fold)
(el-get-bundle wgrep)
(el-get-bundle which-key)
(el-get-bundle yasnippet)
(el-get-bundle ztree)

(el-get 'sync)

;; * Autres paquets via source

(add-to-list 'load-path "~/racine/plugin/source/mtorus")
(add-to-list 'load-path "~/racine/plugin/source/xah-math-input")

;; * Provide

(provide 'personnel-paquet-bundle)

;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
