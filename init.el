(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(boon-enclosures
   '((65 "⟨" "⟩")
     (97 "<" ">")
     (98 "[" "]")
     (99 "{-" "-}")
     (113 "\"" "\"")
     (68 "*" "*")
     (102 "«" "»")
     (104 "#" "#")
     (115 "/" "/")
     (109 "\\(" "\\)")
     (77 "\\[" "\\]")
     (111 "(" ")")
     (112 "(" ")")
     (100 "'" "'")
     (101 "*" "*")
     (114 "{" "}")
     (116 "~" "~")))
 '(custom-enabled-themes '(smart-orange))
 '(custom-safe-themes
   '("0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "2758ce000a4abc19adbb35a7349bd30f0db1a2b81e2965e2f00b1c093436510a" "a8c99d5db39a5e14179a7f590f29be951f7cb48b376617a0ed20c7800843779d" "15aac73660af033eb3f25cdb8dab5df365b573346d4b4ec3272f6db8b251ceaf" "c1d4aaa3aa729df2513bf6dc03d96ed57f5020be8cd8e4d3a6ec2f64950bbba2" "7675ffd2f5cb01a7aab53bcdd702fa019b56c764900f2eea0f74ccfc8e854386" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "635fe07615592e5a641ae61180e08f938bbe6c8d077a9a98a7bcf056fcc2ad5b" "ae65ccecdcc9eb29ec29172e1bfb6cadbe68108e1c0334f3ae52414097c501d2" "828d47ac5f3c9c5c06341b28a1d0ebd9f0a0a9c4074504626148f36c438321c2" "6f9fc46380ff9f00da8c10b47bfb01341fe4d8a0e68dffffb0c0ba1d2cd887d8" default))
 '(dired-listing-switches "-alh")
 '(display-line-numbers-type 'relative)
 '(fringe-mode 6 nil (fringe))
 '(linum-format " %7i ")
 '(magit-diff-refine-hunk 'all)
 '(menu-bar-mode nil)
 '(org-agenda-files '("~/Dropbox/wikorg/agenda.org"))
 '(org-default-notes-file "~/Dropbox/wikorg/agenda.org")
 '(org-link-search-must-match-exact-headline nil)
 '(org-structure-template-alist
   '(("a" . "export ascii")
     ("c" . "center")
     ("C" . "comment")
     ("e" . "example")
     ("E" . "export")
     ("h" . "export html")
     ("l" . "export latex")
     ("q" . "quote")
     ("s" . "src")
     ("v" . "verse")
     ("n" . "citacao")))
 '(package-selected-packages
   '(emacs-everywhere pdf-view-restore mpages auctex-latexmk org-plus-contrib auctex nov goto-chg org-wc edit-server moe-theme rainbow-delimiters peep-dired dired-du company olivetti ssh-agency command-log-mode xah-fly-keys paredit use-package magit nlinum-relative racket-mode slime openwith hydra key-chord avy which-key counsel boon))
 '(powerline-color1 "#6D3300")
 '(powerline-color2 "#411E00")
 '(reftex-cite-format "\\cite[]{%l}")
 '(reftex-cite-prompt-optional-args t)
 '(reftex-default-bibliography '("~/Dropbox/Texts/Works/citations.bib"))
 '(scroll-bar-mode nil)
 '(sentence-end nil)
 '(sentence-end-base "[.?!…‽;][]\"'”’)}]*")
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fantasque Sans Mono" :size 16 :foundry "PfEd" :slant normal :weight normal :height 143 :width normal))))
 '(link ((t (:foreground "#869ed6"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "gold" :weight bold))))
 '(region ((t nil))))
 
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(org-babel-load-file
  (expand-file-name "settings.org"
                    user-emacs-directory))

