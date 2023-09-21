;; -*- mode: lisp -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("062cb1e0edbbcb23601a1e1749f2f0f419342c4c4a38be64ec73ab8210c31ba3" "cbcb9648578d87bbb1a0d35ebfaf604ac39db57cb8f707a38715849569e40824" "cd6ba7f81c2b0096c23dfadb382fab8bdb4a82a61c27e4cfa55c02a18b210f36" "d0d28778c8450067c19ff7e0211df5d97d15ff0a3b012d4dd3580370d4f8d496" "739a4291e3d26a9d7819a3a35105206022584941e2f047fb55a6b35bd44552c8" "6fe2fcbdd1664eb9c66ae204bdde6861fce4c89ae46d6b504c645681baa5ee04" "2b387e94e2e629adf083e71e070e004d9c29781ed490d3e89b6c24bfb12a3245" "aa43f0edb3f597710798a15844a1616fd24999caf6a93432a0a2a0fb7d7e74fa" "eb9d4520e904071bb79e6d0f1e49e4827137d6ba13af5f45da72148f961184ef" "46f5622799085379df59bcdcb04d07ee157b5be0b0801ba16a78d05c1ca77497" "02c5a10185ea96ddb771b8b2f4398c6649890090b029d1fbf1db2bc1336e6485" "e28c36c92a7f26abc11cb826e0d9685578412b8aa293840c858170f009ecbf5d" "0897e39e2f73345a23b74e9b61290d986574eb835b29ddd6652ddea2686f4969" "89ef9221827e3d8fb03283acb0d4f88eae243b293a3fe48408a2756dabbe771b" default))
 '(ggtags-completing-read-function nil t)
 '(global-undo-tree-mode 1 nil nil "Customized with use-package undo-tree")
 '(key-chord-one-key-delay 0.12 nil nil "Customized with use-package key-chord")
 '(key-chord-two-keys-delay 0.12 nil nil "Customized with use-package key-chord")
 '(org-agenda-files
   '("~/racine/organ/orgmode/agenda.org" "~/racine/organ/orgmode/taches.org"))
 '(package-selected-packages '("magit" "magit" magit switch-window async use-package))
 '(region-bindings-mode-disable-predicates ((lambda nil buffer-read-only)) nil nil "Customized with use-package region-bindings-mode")
 '(safe-local-variable-values
   '((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
	   (add-hook 'write-contents-functions
		     (lambda nil
		       (delete-trailing-whitespace)
		       nil))
	   (require 'whitespace)
	   "Sometimes the mode needs to be toggled off and on."
	   (whitespace-mode 0)
	   (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail)
     (ffip-project-root . "~/racine/artist")
     (ffip-project-root . "~/racine/bin")
     (ffip-project-root . "~/racine/plain")))
 '(switch-window-increase 4 t nil "Customized with use-package switch-window")
 '(undo-tree-auto-save-history t nil nil "Customized with use-package undo-tree")
 '(undo-tree-history-directory-alist '((".*" . "~/racine/varia/undo/emacs/")) nil nil "Customized with use-package undo-tree")
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
