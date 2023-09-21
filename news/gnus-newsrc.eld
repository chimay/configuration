;; -*- mode:emacs-lisp; coding: utf-8-emacs; -*-
;; Gnus startup file.
;; Never delete this file -- if you want to force Gnus to read the
;; .newsrc file (if you have one), touch .newsrc instead.
(setq gnus-newsrc-file-version "Gnus v5.13")

(setq gnus-newsrc-last-checked-date '"Sun, 18 Mar 2018 16:11:08 +0100")

(setq gnus-newsrc-alist '(("nndraft:drafts" 1 nil nil (nndraft "") ((gnus-dummy (gnus-draft-mode)))) ("gmane.linux.arch.general" 3 ((48693 . 49194)) ((seen (48693 . 49194)))) ("gmane.linux.arch.devel" 3 (19885 19977 20186)) ("gmane.emacs.customize" 3 ((1 . 16) (19 . 33) (42 . 51) (56 . 62) (64 . 66) (73 . 77) (79 . 117) (119 . 195)) ((seen (17 . 18) (34 . 41) (52 . 55) 63 (67 . 72) 78 118 (196 . 207)))) ("gmane.emacs.devel" 3 ((1 . 826) 164463) ((seen (164459 . 164958)))) ("gmane.linux.arch.tur.user" 3 nil) ("gmane.editors.vim" 3 ((1 . 475) 113602 113610 113905 114038) ((seen (113602 . 114101)))) ("gwene.org.archlinux.aur" 3 ((20113 . 20117) 20122 (60119 . 60126)) ((unexist) (seen (20113 . 20612) (60115 . 61114))))))

(setq gnus-server-alist '(("archive" nnfolder "archive" (nnfolder-directory "~/Mail/archive") (nnfolder-active-file "~/Mail/archive/active") (nnfolder-get-new-mail nil) (nnfolder-inhibit-expiry t))))

(setq gnus-topic-topology '(("Gnus" visible nil nil) (("misc" visible nil nil))))

(setq gnus-topic-alist '(("misc" "nndraft:drafts" "gmane.linux.arch.general" "gmane.linux.arch.devel" "gmane.emacs.customize" "gmane.emacs.devel" "gmane.linux.arch.tur.user" "gmane.editors.vim") ("Gnus" "gwene.org.archlinux.aur")))
