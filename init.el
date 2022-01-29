(require 'package)
;;(setq debug-on-error t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-enable-at-startup nil)
(setq package-archive-priorities '(("melpa" . 1)))

(package-initialize)

;; use-package 가 설치되어 있지 않으면 설치
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (eval-when-compile (require 'use-package)))

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
