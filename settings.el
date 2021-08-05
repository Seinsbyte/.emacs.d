(setq inhibit-startup-screen t)
(blink-cursor-mode)
(require 'moe-theme)
(moe-light)

(require 'org)

	  (add-hook 'org-mode-hook 'turn-on-flyspell)
	  (add-hook 'org-mode-hook 'auto-fill-mode)
	  (add-hook 'org-mode-hook 'nlinum-relative-mode)
	  (defun my-org-insert-file ()
	    (interactive)
	    (let ((current-prefix-arg '(4)))
	      (call-interactively 'org-insert-link)
	      ))


	  (global-set-key (kbd "C-c f") 'my-org-insert-file)
	  (global-set-key (kbd "C-c i") 'ispell-word)
	  (global-set-key (kbd "C-c x") 'my-id-get-or-generate)
	  (global-set-key (kbd "C-c c") 'reftex-citation)
	  (global-set-key (kbd "C-c h") 'org-wc-display)

	  (require 'goto-chg)
	  (global-set-key (kbd "C-c g") 'goto-last-change)

	  (setq magit-diff-options (list "--word-diff=color")) 

	  (setq org-capture-templates
		'(
		("t"
		"Todo list item"
		entry
		(file+headline org-default-notes-file "Tasks")
		"* TODO %?\n %i\n %a")
		("j"
		"Journal Entry"
		entry (file+datetree "~/Dropbox/wikorg/journal.org")
		(file "~/Dropbox/dotfiles/templates/journaltemplate.org")
		)))

	  (require 'org-tempo)      
	  ;;;; Org Latex
      (with-eval-after-load 'ox-latex
	(add-to-list 'org-latex-classes
		   '("abntex2"
		 "\\documentclass{abntex2}"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

	(setq org-latex-toc-command "\\clearpage \\tableofcontents \\clearpage")
	(setq org-latex-pdf-process (list
	     "latexmk -pdflatex='lu alatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

    (require 'ox-extra)
    (ox-extras-activate '(ignore-headlines))

(require 'hydra)

(defhydra hydra-dired (:exit t)
		  "dired"
		  ("p" (dired "~/Dropbox/Academic/Philosophy") "Philpapers")
		  ("b" (dired "~/Books") "Books")
		  ("i" (find-file "~/.emacs.d/init.el") "initel")
		  ("d" (dired "~/Downloads") "Downloads")
		  ("o" (dired "~/Dropbox/wikorg") "Wikorg")
		  ("j" (find-file "~/Dropbox/wikorg/journal.org") "Journal")
		  ("r" (dired "~/Games") "Rpgs")
		  ("h" (dired "~/") "Home")
		  ("s" (find-file "~/.emacs.d/settings.org") "Settings")
		  ("a" (find-file "~/Dropbox/wikorg/agenda.org") "Agenda")
		  ("t" (find-file "~/Dropbox/Texts/") "Texts")
		  )

    ;; (define-prefix-command 'my-z-keymap)
    ;; (define-key my-z-keymap (kbd "p") '(lambda() (interactive)(dired  "~/Dropbox/Academic/Philosophy")))

(require 'openwith)

  (setq openwith-associations
  '(("\\.pd\\'" "zathura" (file))
  ("\\.odt\\'" "libreoffice"(file))
("\\.docx\\'" "libreoffice"(file))
  ("\\.djvu\\'" "zathura" (file))
  ("\\.epub\\'" "zathura" (file))
  ("\\.doc\\'" "libreoffice" (file))
  ("\\.rtf\\'" "libreoffice" (file))
  ("\\.flac\\'" "mpv" (file))
  ("\\.cbr\\'" "mcomix" (file))
  ("\\.azw3\\'" "ebook-viewer" (file))
  ("\\.azw\\'" "ebook-viewer" (file))
  ("\\.mobi\\'" "ebook-viewer" (file))
  )
  )
  (openwith-mode t)

(pdf-tools-install)
(which-key-mode)
(setq inferior-lisp-program "sbcl")
(require 'smartparens-config)
;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)
(setenv "SSH_ASKPASS" "git-gui--askpass")
(add-hook 'magit-mode-hook 'visual-line-mode)



(global-set-key (kbd "<f5>") 'ibuffer)
(global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c t") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c w") 'search-web)

(global-set-key (kbd "C-c j")
(lambda () (interactive) (org-capture nil "j")))

(global-set-key (kbd "C-c t")
(lambda () (interactive) (org-capture nil "t")))

(use-package peep-dired
  :ensure t
  :defer t ; don't access `dired-mode-map' until `peep-dired' is loaded
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(add-hook 'dired-mode-hook
          (lambda () (local-set-key (kbd "h") 'avy-goto-word-1)))

(add-hook 'eww-mode-hook
		  (lambda () (local-set-key (kbd "h") 'avy-goto-word-1)))

(setq search-engines
'(
(("google" "g") "https://google.com/search?q=%s")
(("duckduckgo" "d" "ddg") "https://duckduckgo.com/?q=%s")
(("wiktionary" "w") "https://en.wiktionary.org/wiki/%s")
))
(setq search-engine-default "duckduckgo")

(require 'xah-fly-keys)
    (xah-fly-keys-set-layout "qwerty") ; required
    (xah-fly-keys)

    (with-eval-after-load 'xah-fly-keys
      ;; Command mode keybindings:
      (define-key xah-fly-insert-map (kbd "<escape>") #'xah-fly-command-mode-activate-no-hook)
      (define-key xah-fly-command-map (kbd "2") #'eval-region-and-deactivate)
      (define-key xah-fly-command-map (kbd "G") #'insert-delete)
      (define-key xah-fly-command-map (kbd "O") #'forward-sentence)
      (define-key xah-fly-command-map (kbd ">") #'xah-forward-quote-smart)
      (define-key xah-fly-command-map (kbd "M") #'xah-backward-quote)
      (define-key xah-fly-command-map (kbd "U") #'backward-sentence)
      (define-key xah-fly-leader-key-map (kbd "z") 'hydra-dired/body)
      (define-key xah-fly-leader-key-map (kbd "9") 'flyspell-buffer)
      (define-key xah-fly-leader-key-map (kbd "8") 'ispell-word)
      (define-key xah-fly-e-keymap (kbd "s") 'xah-insert-fslash)
      (define-key xah-fly-e-keymap (kbd "a") 'xah-insert-asterisk)
	)

    (defun insert-delete (b e)
      (interactive "*r")
		   (kill-region b e)
		   (xah-fly-insert-mode-activate))

    (with-eval-after-load 'pdf-view
      (define-key pdf-view-mode-map [remap next-line] #'pdf-view-next-line-or-next-page)
      (define-key pdf-view-mode-map [remap previous-line] #'pdf-view-previous-line-or-previous-page)
      (define-key pdf-view-mode-map [remap xah-copy-line-or-region] #'pdf-view-kill-ring-save)
      (define-key pdf-view-mode-map [remap forward-word] #'pdf-outline))

    (defun pdf-config-xah-fly-key ()
      "Modify keys for xah fly key command mode keys
    To be added to `xah-fly-command-mode-activate-hook'"
      (interactive)
      (define-key xah-fly-leader-key-map (kbd "c") 'pdf-view-kill-ring-save)
      )


    (defun pdf-xah-wrapper ()
      "call different commands depending on what's current major mode."
      (interactive)
      (cond
       ((string-equal major-mode "pdf-view-mode") ((add-hook 'xah-fly-command-mode-activate-hook 'pdf-config-xah-fly-key)))
       ;; if nothing match, do nothing
       (t nil)))

(defun xah-insert-fslash ()
  (interactive)
  (xah-insert-bracket-pair "/" "/") )

(defun xah-insert-asterisk ()
  (interactive)
  (xah-insert-bracket-pair "*" "*") )

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(define-key ivy-minibuffer-map (kbd "C-<return>") 'ivy-immediate-done)

(defun eval-region-and-deactivate ()
		       (interactive)
		       (when (use-region-p)
		      (eval-region (region-beginning) (region-end)))
		      (deactivate-mark t))

	    (defun search-get-engine (engine-name engine-list)
		    (cond
		     ((null engine-list) nil)
		     ((member engine-name (caar engine-list)) (cadar engine-list))
		     (t (search-get-engine engine-name (cdr engine-list)))))
	    (defun search-engine (engine-name term)
		  "Search for a term using an engine."
		  (interactive "MEngine: \nMTerm: ")
		  (let* ((url (search-get-engine engine-name search-engines)))
		    (if (equal url nil)
			(message "Error: search engine \"%s\" unknown." engine-name)
		      (eww (format url (url-hexify-string term))))))
	    (defun search-web (term)
		"Search the web using google or a specified engine."
		(interactive "MQuery: ")
		(let ((idx (position ?: term)))
		  (if (equal idx nil)
		      (search-engine search-engine-default term)
		    (search-engine (subseq term 0 idx)
				   (subseq term (+ 1 idx))))))


(defun my-generate-sanitized-alnum-dash-string(str)
"Returns a string which contains only a-zA-Z0-9 with single dashes
 replacing all other characters in-between them.

 Some parts were copied and adapted from org-hugo-slug
 from https://github.com/kaushalmodi/ox-hugo (GPLv3)."
(let* (;; Remove "<FOO>..</FOO>" HTML tags if present.
       (str (replace-regexp-in-string "<\\(?1:[a-z]+\\)[^>]*>.*</\\1>" "" str))
       ;; Remove URLs if present in the string.  The ")" in the
       ;; below regexp is the closing parenthesis of a Markdown
       ;; link: [Desc](Link).
       (str (replace-regexp-in-string (concat "\\](" ffap-url-regexp "[^)]+)") "]" str))
       ;; Replace "&" with " and ", "." with " dot ", "+" with
       ;; " plus ".
       (str (replace-regexp-in-string
	     "&" " and "
	     (replace-regexp-in-string
	      "\\." " dot "
	      (replace-regexp-in-string
	       "\\+" " plus " str))))
       ;; Replace German Umlauts with 7-bit ASCII.
       (str (replace-regexp-in-string "[Ä]" "Ae" str t))
       (str (replace-regexp-in-string "[Ü]" "Ue" str t))
       (str (replace-regexp-in-string "[Ö]" "Oe" str t))
       (str (replace-regexp-in-string "[ä]" "ae" str t))
       (str (replace-regexp-in-string "[ü]" "ue" str t))
       (str (replace-regexp-in-string "[ö]" "oe" str t))
       (str (replace-regexp-in-string "[ß]" "ss" str t))
       ;; Replace all characters except alphabets, numbers and
       ;; parentheses with spaces.
       (str (replace-regexp-in-string "[^[:alnum:]()]" " " str))
       ;; On emacs 24.5, multibyte punctuation characters like "："
       ;; are considered as alphanumeric characters! Below evals to
       ;; non-nil on emacs 24.5:
       ;;   (string-match-p "[[:alnum:]]+" "：")
       ;; So replace them with space manually..
       (str (if (version< emacs-version "25.0")
		(let ((multibyte-punctuations-str "：")) ;String of multibyte punctuation chars
		  (replace-regexp-in-string (format "[%s]" multibyte-punctuations-str) " " str))
	      str))
       ;; Remove leading and trailing whitespace.
       (str (replace-regexp-in-string "\\(^[[:space:]]*\\|[[:space:]]*$\\)" "" str))
       ;; Replace 2 or more spaces with a single space.
       (str (replace-regexp-in-string "[[:space:]]\\{2,\\}" " " str))
       ;; Replace parentheses with double-hyphens.
       (str (replace-regexp-in-string "\\s-*([[:space:]]*\\([^)]+?\\)[[:space:]]*)\\s-*" " -\\1- " str))
       ;; Remove any remaining parentheses character.
       (str (replace-regexp-in-string "[()]" "" str))
       ;; Replace spaces with hyphens.
       (str (replace-regexp-in-string " " "-" str))
       ;; Remove leading and trailing hyphens.
       (str (replace-regexp-in-string "\\(^[-]*\\|[-]*$\\)" "" str)))
  str)
)

(require 'org-id) 
  (defun my-id-get-or-generate()
  "Returns the ID property if set or generates and returns a new one if not set.
   The generated ID is stripped off potential progress indicator cookies and
   sanitized to get a slug. Furthermore, it is prepended with an ISO date-stamp
   if none was found before."
      (interactive)
	  (when (not (org-id-get))
	      (progn
		 (let* (
			(my-heading-text (nth 4 (org-heading-components)));; retrieve heading string
			(my-heading-text (replace-regexp-in-string "[[][0-9%/]+[]] " "" my-heading-text));; remove progress indicators like "[2/7]" or "[25%]"
			(new-id (my-generate-sanitized-alnum-dash-string my-heading-text));; get slug from heading text
		       )
		     ;;(message (concat "HEADING: " my-heading-text))
		     (when (not (string-match "[12][0-9][0-9][0-9]-[01][0-9]-[0123][0-9]-.+" new-id))
			     ;; only if no ISO date-stamp is found at the beginning of the new id:
			     (setq new-id (concat (format-time-string "%Y-%m-%d-") new-id)))
		     (org-set-property "ID" new-id)
		     )
		   )
	  )
	  (kill-new (concat "id:" (org-id-get)));; put ID in kill-ring
	  (org-id-get);; retrieve the current ID in any case as return value
  )

(define-minor-mode ospl-mode
  "One Sentence Per Line"
  :init-value nil
  :lighter " ospl"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "M-q") 'ospl/fill-paragraph)
	    map)

  ;; (if ospl-mode
  ;;     (progn
  ;;       (visual-line-mode 1)
  ;;       (setq right-margin-width (- (window-body-width) fill-column)))
  ;;   (visual-line-mode -1)
  ;;   (setq right-margin-width 0))

  (if ospl-mode
      (progn
	(visual-line-mode 1)))

  ;; Account for new margin width
  (set-window-buffer (selected-window) (current-buffer)))


(defun ospl/unfill-paragraph ()
  "Unfill the paragraph at point.

This repeatedly calls `join-line' until the whole paragraph does
not contain hard line breaks any more."
  (interactive)
  (forward-paragraph 1)
  (forward-paragraph -1)
  (while (looking-at paragraph-start)
    (forward-line 1))
  (let ((beg (point)))
    (forward-paragraph 1)
    (backward-char 1)
    (while (> (point) beg)
      (join-line)
      (beginning-of-line))))


(defun ospl/fill-paragraph ()
  "Fill the current paragraph until there is one sentence per line.

This unfills the paragraph, and places hard line breaks after each sentence."
  (interactive)
  (save-excursion
    (fill-paragraph)         ; takes care of putting 2 spaces if needed
    (ospl/unfill-paragraph)  ; remove hard line breaks

    ;; insert line breaks again
    (let ((end-of-paragraph (make-marker)))
      (save-excursion
	(forward-paragraph)
	(backward-sentence)
	(forward-sentence)
	(set-marker end-of-paragraph (point)))
      (forward-sentence) 
      (while (< (point) end-of-paragraph)
	(just-one-space)
	(delete-backward-char 1)
	(newline)
	(forward-sentence))
      (set-marker end-of-paragraph nil))))
