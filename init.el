;;-----------------------------------------------------------------------------
;; Package setting
;;-----------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-enable-at-startup nil)
(setq package-archive-priorities '(("melpa" . 1)))
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/customs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load "bootstrap.el")
(load "ui.el")
(load "whichkey.el")
(load "ace.el")
(load "move.el")
(load "git.el")
(load "clojure.el")
(load "web.el")
(load "use-term.el")
(load "use-paredit.el")
(load "use-ivy.el")
(load "use-company.el")
(load "use-swiper.el")
(load "use-evil.el")
