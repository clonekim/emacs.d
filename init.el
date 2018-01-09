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

(use-package cider
  :ensure t
  :pin melpa-stable)

(load "shell-integration.el")
(load "navigation.el")
(load "editing.el")
(load "elisp-editing.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "emmet.el")
(load "web.el")
(load "rjsx-mode.el")
(load "neo.el")
(load "ui.el")
(load "go.el")
(load "git.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (blackboard)))
 '(custom-safe-themes
   (quote
    ("4c7a1f0559674bf6d5dd06ec52c8badc5ba6e091f954ea364a020ed702665aa1" default)))
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format "%5d")
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(package-selected-packages
   (quote
    (magit popwin direx flycheck atom-one-dark-theme flymake-go project-explorer ghq golint go-eldoc auto-complete company-go go-mode web-mode tagedit smex rainbow-delimiters projectile paredit neotree markdown-mode ido-completing-read+ exec-path-from-shell emmet-mode clojure-mode-extra-font-locking))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:height 94)))))
