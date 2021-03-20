;;-----------------------------------------------------------------------------
;; Package setting
;;-----------------------------------------------------------------------------
(require 'package)

;;(setq debug-on-error t)
;;(setq lsp-print-io t)
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;(setq package-enable-at-startup nil)
;(setq package-archive-priorities '(("melpa" . 1)))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/customs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq use-package-always-ensure t)

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
(load "use-helm.el")
(load "use-company.el")
(load "use-swiper.el")
(load "use-evil.el")
