;;; -*- mode: emacs-lisp -*-

;;; * Courriel

;;; ** Données

;; (setq user-mail-address "orduval@gmail.com")
;; (setq user-full-name "chimay")

(setq user-mail-address "fa981522@skynet.be")
(setq user-full-name "David")

;;; ** Send

(setq smtpmail-default-smtp-server "relay.skynet.be")
(setq smtpmail-smtp-server "relay.skynet.be")

(setq smtpmail-local-domain "skynet.be")

;(setq smtpmail-auth-credentials '(("hostname" "port" "username" "password")))
;(setq smtpmail-starttls-credentials '(("hostname" "port" nil nil)))

(load-library "smtpmail")

(setq send-mail-function 'smtpmail-send-it)

(setq message-send-mail-function 'smtpmail-send-it)

;;; ** Read

;;; *** Rmail

(setq rmail-preserve-inbox t)

(setq rmail-primary-inbox-list
      '("/var/spool/mail/david"
	"~/racine/mail/systeme/mbox"
       ))

(setq rmail-ignored-headers
      (concat rmail-ignored-headers
	      "\\|^x-.*:\\|^IronPort-PHdr.*:\\|^Received.*:\\|^DKIM.*:"))

;;; *** Gnus

(setq gnus-select-method
      '(nnimap "proximus"
	       (nnimap-address "imap.proximus.be")
	       (nnimap-inbox "INBOX")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)))

;;; * Provide

(provide 'personnel/perso)

;;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
