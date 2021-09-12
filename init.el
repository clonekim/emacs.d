(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-enable-at-startup nil)
(setq package-archive-priorities '(("melpa-stable" . 1)))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; use-package 가 설치되어 있지 않으면 설치
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (eval-when-compile (require 'use-package)))

(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/dotfiles")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;가비지콜렉터 쓰레드홀드
(setq gc-cons-threshold 10000000)

;; Restore after startup
(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold 1000000)
            (message "gc-cons-threshold restored "
                     gc-cons-threshold)))



(load "bootstrap.el")
(load "use-company.el")
(load "use-evil.el")
(load "use-helm.el")
(load "use-paredit.el")
(load "use-git.el")
(load "use-lsp.el")
(load "doom.el")
(load "web.el")
(load "theme.el")
(load "use-dashboard.el")
