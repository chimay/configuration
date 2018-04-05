;; -*- mode: lisp -*-

;; ** MTorus
;; ==============================

(require 'mtorus)
(mtorus-init)

;; (mtorus-install-suggested-bindings)

(global-set-key (kbd "H-= c") 'mtorus-new-ring)
(global-set-key (kbd "H-= m") 'mtorus-rename-ring)
(global-set-key (kbd "H-= d") 'mtorus-delete-ring)

(global-set-key (kbd "H-= u") 'mtorus-update-current-marker)

(global-set-key (kbd "H-= p") 'mtorus-describe-current-ring)

(global-set-key (kbd "H-= s") 'mtorus-save-torus)
(global-set-key (kbd "H-= r") 'mtorus-read-torus)

(global-set-key (kbd "s-=") 'mtorus-switch-to-ring)

(global-set-key (kbd "<s-insert>") 'mtorus-add-current-pos-to-current-ring)
(global-set-key (kbd "<s-delete>") 'mtorus-delete-current-marker-from-current-ring)

(global-set-key (kbd "<H-insert>") 'mtorus-update-current-marker)

(global-set-key (kbd "<s-home>") 'mtorus-cycle-ring-next)
(global-set-key (kbd "<s-end>") 'mtorus-cycle-ring-previous)

(global-set-key (kbd "<s-prior>") 'mtorus-cycle-marker-previous)
(global-set-key (kbd "<s-next>") 'mtorus-cycle-marker-next)

;; (global-set-key [C-prior] 'mtorus-cycle-blist-prev)
;; (global-set-key [C-next] 'mtorus-cycle-blist-next)

(setq mtorus-save-on-exit t)
(setq mtorus-file-name "~/racine/dotdir/emacs.d/mtorus/mtorus.el")

;; (mtorus-read-torus)

