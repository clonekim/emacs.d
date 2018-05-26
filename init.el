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
(load "go.el")
;; (load "neo.el")
(load "git.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (tango)))
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format "%5d")
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(package-selected-packages
   (quote
    (magit web-mode tagedit rainbow-delimiters popwin paredit js2-mode ido-completing-read+ helm-smex go-eldoc go-autocomplete flymake-go flycheck exec-path-from-shell emmet-mode direx clojure-mode-extra-font-locking cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:height 94)))))
