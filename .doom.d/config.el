;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Eike Sebode"
      user-mail-address "esebode@posteo.net")

(setq doom-font (font-spec :family "FantasqueSansMono Nerd Font" :size 18)
      doom-variable-pitch-font (font-spec :family "FantasqueSansMono Nerd Font" :size 18)
      doom-big-font (font-spec :family "FantasqueSansMono Nerd Font" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
(setq global-prettify-symbols-mode t)

(setq doom-theme 'doom-gruvbox)

(setq org-directory "~/Documents/org/")

(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


; Org-Roam-Config
(use-package! org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory (file-truename "~/Documents/org_roam"))
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 )

; Org-Ref-Config
(setq bibtex-completion-bibliography "~/Documents/references/library.bib"
      bibtex-completion-library-path "~/Zotero/storage"
      bibtex-completion-notes-path "~/Documents/references/notes/")

;; open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

;; render citations properly
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

(require 'org-ref)

; Ivy-Bibtex-Config
(setq bibtex-completion-bibliography '("~/Documents/references/library.bib")
      bibtex-completion-library-path '("~/Zotero/storage/")
      bibtex-completion-pdf-field "Field"
      bibtex-completion-notes-path "~/Documents/references/notes/"
      )

; Org-Bullets_config
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; alternative
;; (setq bibtex-completion-pdf-open-function 'org-open-file)

;: Fixes and stuff
; Fix for mode line beeing cut off
(after! doom-modeline
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info minor-modes checker input-method buffer-encoding major-mode process vcs "  "))) ; <-- added padding here
