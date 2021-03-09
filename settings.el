(setq inhibit-startup-screen t)
(blink-cursor-mode)
(require 'moe-theme)
(moe-light)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(define-key ivy-minibuffer-map (kbd "C-<return>") 'ivy-immediate-done)

(require 'org)

(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'nlinum-relative-mode)
(defun my-org-insert-file ()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'org-insert-link)
    ))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c C-1") 'org-capture)
(global-set-key (kbd "C-c C-2") 'org-agenda)
(global-set-key (kbd "C-c C-3") 'my-org-insert-file)
(global-set-key (kbd "C-c C-4") 'ispell-word)
(global-set-key (kbd "C-c C-5") 'reftex-citation)

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
(setq org-latex-toc-command "\\tableofcontents \\clearpage")
(setq org-latex-pdf-process (list
   "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))

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
  )

(global-set-key (kbd "<S-SPC>") 'delete-backward-char)
(pdf-tools-install)
(which-key-mode)
(setq inferior-lisp-program "sbcl")
(require 'smartparens-config)
;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)
(setenv "SSH_ASKPASS" "git-gui--askpass")
(add-hook 'magit-mode-hook 'visual-line-mode)
(global-set-key (kbd "<f5>") 'ibuffer)

(use-package peep-dired
  :ensure t
  :defer t ; don't access `dired-mode-map' until `peep-dired' is loaded
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(add-hook 'dired-mode-hook
          (lambda () (local-set-key (kbd "h") 'avy-goto-word-1)))

(add-hook 'eww-mode-hook
          (lambda () (local-set-key (kbd "h") 'avy-goto-word-1)))

(require 'xah-fly-keys)
(xah-fly-keys-set-layout "qwerty") ; required

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
    )

(defun insert-delete (b e)
  (interactive "*r")
	       (kill-region b e)
	       (xah-fly-insert-mode-activate))

(with-eval-after-load 'pdf-view
  (define-key pdf-view-mode-map [remap next-line] #'pdf-view-next-line-or-next-page)
  (define-key pdf-view-mode-map [remap previous-line] #'pdf-view-previous-line-or-previous-page))
