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
(setq package-enable-at-startup nil) ;;improves startup time

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
(load "go.el")
;; (load "neo.el")
(load "git.el")

(setq custom-file (make-temp-file "emacs-custom"))
(load-theme 'aanila t)

(set-face-background 'mode-line "black")
(set-face-foreground 'mode-line "yellow")
