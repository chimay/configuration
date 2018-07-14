;; -*- mode: lisp -*-

;; * Php vers org sans niveau un

(defun perso/php-vers-org-sans-niveau-un ()

  (interactive)

  (goto-char (point-min))

  (while (search-forward-regexp "|" nil t)
    (replace-match "¦" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&nbsp;" nil t)
    (replace-match " " t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&ensp;" nil t)
    (replace-match " " t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&emsp;" nil t)
    (replace-match " " t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&mdash;" nil t)
    (replace-match "—" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&amp;" nil t)
    (replace-match "&" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&lt;" nil t)
    (replace-match "<" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&gt;" nil t)
    (replace-match ">" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&laquo;" nil t)
    (replace-match "«" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&raquo;" nil t)
    (replace-match "»" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "<br />" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "</?p>" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "</?em>" nil t)
    (replace-match "/" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "</?span\\( class=[^>]+\\)?>" nil t)
    (replace-match "/" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "</?strong>" nil t)
    (replace-match "*" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<!--.*-->
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp " fgcolor=[^ >]+" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp " bgcolor=[^ >]+" nil t)
    (replace-match "" t nil))
  (goto-char (point-min))

  (while (search-forward-regexp "^<\\?php[^>]*\\?>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<\\?php

include.*
charge.*

\\?>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<!DOCTYPE[^>]*
[^>]*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<html xmlns=[^>]*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^</?head>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<meta[^>]*/>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<link[^>]*/>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<script[^>]*>[^<]*</script>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<title[^>]*>[^<]*</title>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<body[^>]*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^</body></html>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<a onClick=.interrupteur.*(.*).*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<a onClick=.eventail.*(.*).*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<pre class=.notes?.>$" nil t)
    (replace-match "#+BEGIN_EXAMPLE" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^</pre>$" nil t)
    (replace-match "#+END_EXAMPLE" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<div class=.*>
\\(.+\\)
</div>" nil t)
    (replace-match (concat "#+BEGIN_EXAMPLE\n" (match-string 1) "\n#+END_EXAMPLE") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^<div class=.*>
\\(.+\\)
\\(.+\\)
</div>" nil t)
    (replace-match (concat "#+BEGIN_EXAMPLE\n" (match-string 1) "\n" (match-string 2) "\n#+END_EXAMPLE") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^<div class=.*>
\\(.+\\)
\\(.+\\)
\\(.+\\)
</div>" nil t)
    (replace-match (concat "#+BEGIN_EXAMPLE\n"
			   (match-string 1) "\n"
			   (match-string 2) "\n"
			   (match-string 3)
			   "\n#+END_EXAMPLE") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^<div id=[^>]*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<div class=[^>]*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^</div[^>]*>
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^</div[^>]*> <!--.*-->
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^<a href=.#.*</a>\\(<br />\\)+
" nil t)
  (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<h6[^>]*>\\([^<]+\\)</h6>.*$" nil t)
    (replace-match (concat "\n***** " (match-string 1)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<h5[^>]*>\\([^<]+\\)</h5>.*$" nil t)
    (replace-match (concat "\n**** " (match-string 1)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<h4[^>]*>\\([^<]+\\)</h4>.*$" nil t)
    (replace-match (concat "\n*** " (match-string 1)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<h3[^>]*>\\([^<]+\\)</h3>.*$" nil t)
    (replace-match (concat "\n** " (match-string 1)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<h2[^>]*>\\([^<]+\\)</h2>.*$" nil t)
    (replace-match (concat "\n* " (match-string 1) "\n\n#+TOC: headlines 1 local") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^</?ul>$" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<li>\\(.+\\)</li>$" nil t)
    (replace-match (concat "\n  - " (match-string 1)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<li>\\(.+\\)
\\(.+\\)</li>" nil t)
    (replace-match (concat "\n  - " (match-string 1) " " (match-string 2)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<li>\\(.+\\)
\\(.+\\)
\\(.*\\)</li>" nil t)
    (replace-match (concat "\n  - " (match-string 1) " "
			   (match-string 2) " "
			   (match-string 3)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp " rowspan=." nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp " colspan=." nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "<tr>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
</tr>" nil t)
    (replace-match (concat "| " (match-string 1)
			   "|" (match-string 2)
			   "|" (match-string 3)
			   "|" (match-string 4)
			   "|" (match-string 5)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "<tr>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
</tr>" nil t)
    (replace-match (concat "| " (match-string 1)
			   "|" (match-string 2)
			   "|" (match-string 3)
			   "|" (match-string 4)) t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "<tr>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
</tr>" nil t)
    (replace-match (concat "| " (match-string 1) "|" (match-string 2) "|" (match-string 3) "|") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "<tr>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)</td>
</tr>" nil t)
    (replace-match (concat "| " (match-string 1) "|" (match-string 2) "|") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "<tr>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)
\\(.+\\)</td>
</tr>" nil t)
    (replace-match (concat "| " (match-string 1) "|" (match-string 2) (match-string 3) "|") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "<tr>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*<td>\\(.+\\)
\\(.+\\)
\\(.+\\)</td>
</tr>" nil t)
    (replace-match (concat "| " (match-string 1) "|" (match-string 2)
			   (match-string 3) (match-string 4) "|") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "<tr>
[[:space:]]*<td>\\(.+\\)</td>
[[:space:]]*</tr>" nil t)
    (replace-match (concat "| " (match-string 1) "||") t 'literal))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*</?table[^>]*>$" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^[[:space:]]*<h1[^>]*>\\([^>]+\\)</h1>.*
" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "<br />" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "&nbsp;" nil t)
    (replace-match " " t nil))

  (goto-char (point-min))

  (while (re-search-forward "^\\(.*\\)	+\\(.*\\)$" nil t)
    (replace-match (concat (match-string 1) " " (match-string 2)) t 'literal))

  (goto-char (point-min))

  (while (re-search-forward "^|\\(.*\\)	+\\(|\\)?$" nil t)
    (replace-match (concat "| " (match-string 1) " " (match-string 2)) t 'literal))

  (goto-char (point-min))

  (while (re-search-forward "^|\\(.*\\)[ 	]\\{2,\\}\\(.*\\)$" nil t)
    (replace-match (concat "| " (match-string 1) " " (match-string 2)) t 'literal))

  ;; Lignes simples

  (goto-char (point-min))

  (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
    (replace-match "\n")
    (forward-char 1))

  (goto-char (point-min))
)

;; * Tex vers org

(defun perso/tex-vers-org ()

  (interactive)

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\subsubsection[^{]*{\\([^}]+\\)}$" nil t)
    (replace-match (concat "\n**** " (match-string 1)) t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\subsection[^{]*{\\([^}]+\\)}$" nil t)
    (replace-match (concat "\n*** " (match-string 1)) t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\section[^{]*{\\([^}]+\\)}$" nil t)
    (replace-match (concat "\n** " (match-string 1)) t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\chapter[^{]*{\\([^}]+\\)}$" nil t)
    (replace-match (concat "\n* " (match-string 1)) t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\chapter[^{]*{\\([^}]+\\)}
" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward "~" nil t)
    (replace-match " " t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\begin{Eqts}" nil t)
    (replace-match "#+BEGIN_CENTER\n\\\\(" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\end{Eqts}" nil t)
    (replace-match "\\\\)\n#+END_CENTER" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\begin{itemize}
" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\end{itemize}
" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\item" nil t)
    (replace-match "  -" t nil))

  (goto-char (point-min))
)

;; * Tex vers org sans niveau un

(defun perso/tex-vers-org-sans-niveau-un ()
  (interactive)

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\subsubsection[^{]*{\\([^}]+\\)}$" nil t)
    (replace-match (concat "\n*** " (match-string 1)) t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\subsection[^{]*{\\([^}]+\\)}$" nil t)
    (replace-match (concat "\n** " (match-string 1)) t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\section[^{]*{\\([^}]+\\)}$" nil t)
    (replace-match (concat "\n* " (match-string 1)) t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\chapter[^{]*{\\([^}]+\\)}
" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward "~" nil t)
    (replace-match " " t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\begin{Eqts}" nil t)
    (replace-match "#+BEGIN_CENTER\n\\\\(" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\end{Eqts}" nil t)
    (replace-match "\\\\)\n#+END_CENTER" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\begin{itemize}
" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\end{itemize}
" nil t)
    (replace-match "" t nil))

  (goto-char (point-min))

  (while (search-forward-regexp "^\\\\item" nil t)
    (replace-match "  -" t nil))

  (goto-char (point-min))
)

;; * Bouts de code

;; (query-replace-regexp "^\\chapter{\([^}]*\)}$" "* \1" nil (point-min) (point-max))

;; * Provide

(provide 'personnel-fonction)

;; * Variables locales

;; Local Variables:
;; eval: (outline-minor-mode)
;; outline-regexp: "^[;]*[ ]*[*]+"
;; End:
