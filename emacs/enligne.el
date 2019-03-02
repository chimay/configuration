;; -*- mode: lisp -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/racine/plain/orgdir/agenda.org" "~/racine/plain/orgdir/taches.org"))
 '(package-selected-packages '("magit" "magit" magit switch-window async use-package))
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
     (ffip-project-root . "~/racine/plain"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
