(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("melpa" . "http://melpa.org/packages/") 
                           ("gnu" . "http://elpa.gnu.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")
                           ("melpa-stable" . "https://stable.melpa.org/packages/")))

  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(load "shell-integration.el")
(load "navigation.el")
(load "editing.el")
(load "elisp-editing.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "emmet.el")
(load "web.el")
(load "rjsx-mode.el")
(load "ui.el")
;; (load "go.el")
;; (load "neo.el")
(load "git.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (wombat)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format "%5d")
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(package-selected-packages
   (quote
    (magit web-mode tagedit rainbow-delimiters popwin paredit js2-mode ido-completing-read+ helm-smex go-eldoc go-autocomplete flymake-go flycheck exec-path-from-shell emmet-mode direx clojure-mode-extra-font-locking cider)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))

;;; for wombat
(set-face-attribute hl-line-face nil :underline nil)
(set-face-background 'hl-line "grey27")
