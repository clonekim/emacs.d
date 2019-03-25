;;-----------------------------------------------------------------------------
;; Package setting
;;-----------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(setq package-enable-at-startup nil)
(setq package-archive-priorities '(("melpa-stable" . 1)))
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))


;;-----------------------------------------------------------------------------
;; Bootstrap
;;-----------------------------------------------------------------------------

(defun gc-disable ()
  "Disable automatic garbage collection."
  (setq gc-cons-threshold most-positive-fixnum))

(defun gc-enable ()
  "Enable automatic garbage collection."
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'gc-disable)
(add-hook 'minibuffer-exit-hook #'gc-enable)
(gc-enable)
(setq custom-file (make-temp-file "emacs-custom"))
(fset 'yes-or-no-p 'y-or-n-p)
;;(load-theme 'aanila t)

;;-----------------------------------------------------------------------------
;; Editing
;;-----------------------------------------------------------------------------

(blink-cursor-mode -1)
(delete-selection-mode t)
(global-hl-line-mode 1)
(global-auto-revert-mode -1)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "S-SPC") 'ignore)
(show-paren-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)
(setq-default cursor-type 'box)

(use-package whole-line-or-region  :ensure t)

(use-package rainbow-delimiters  :ensure t)

(use-package whitespace)

(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :init (global-whitespace-cleanup-mode))

(use-package which-key
  :ensure t
  :init (which-key-mode +1))

(set-cursor-color "yellow")
(set-face-background 'mode-line "black")
(set-face-foreground 'mode-line "yellow")


;;-----------------------------------------------------------------------------
;; Web
;;-----------------------------------------------------------------------------

(use-package web-mode
  :ensure t
  :init
  (add-hook 'html-mode-hook 'subword-mode)
  (add-hook 'web-mode-hook (lambda ()
                             (setq web-mode-enable-auto-pairing nil)
                             (setq web-mode-markup-indent-offset 2)
                             (setq web-mode-css-indent-offset 2)
                             (setq web-mode-code-indent-offset 2)
                             (setq web-mode-enable-current-element-highlight t)
                             (setq web-mode-enable-current-column-highlight t)))
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[aj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode)))


(use-package emmet-mode
  :ensure t
  :init
  (setq emmet-indentation 2)
  (setq emmet-indent-after-insert nil)

  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  :config
  (setq emmet-preview-default 1)
  (define-key emmet-mode-keymap (kbd "C-j") nil)
  (keyboard-translate ?\C-i ?\H-i)
  (define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . emmet-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode)))



(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :init
  (add-hook 'js-mode-hook 'subword-mode)
  :config
  (setq js2-strict-missing-semi-warning nil)
  (setq-default js2-basic-offset 2))


;;-----------------------------------------------------------------------------
;; helm
;;-----------------------------------------------------------------------------
(use-package helm
  :ensure t
  :diminish helm-mode
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ;; ("C-x C-b" . helm-buffers-list)
         ;; ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)
         ("C-x C-o" . ffap))
  :init
  (require 'helm-config)
  (setq helm-candidate-number-limit 100)
  (setq helm-yas-display-key-on-candidate t)
  ;; for pretty fast updates when hitting RET too quickly
  ;; after typing fast:
  (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
        helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
        helm-quick-update t
        helm-M-x-requires-pattern nil
        helm-ff-skip-boring-files t)
  :config  
  (use-package helm-descbinds
    :ensure t
    :config (helm-descbinds-mode)))

(use-package helm-ag
  :ensure t)


(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status )))


;;----------------------------------------------------------------------------
;; Paredit
;;----------------------------------------------------------------------------
(use-package paredit
  :ensure t
  :diminish paredit-mode
  :init
  (use-package paredit-everywhere :ensure t)
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           'enable-paredit-mode))



;;----------------------------------------------------------------------------
;; Clojure & CIDER
;;----------------------------------------------------------------------------
(use-package clojure-mode
  :ensure t
  :config
  (use-package flycheck-clojure
    :ensure t
    :after flycheck
    :commands flycheck-clojure-setup
    :init
    (add-hook 'flycheck-mode-hook #'flycheck-clojure-setup))
  (add-hook 'clojure-mode-hook (lambda ()
                                 (setq indent-tabs-mode nil)
                                 (setq clojure-indent-style :always-align)
				 (define-clojure-indent
				   (defroutes 'defun)
				   (GET 2)
				   (POST 2)
				   (PUT 2)
				   (DELETE 2)
				   (PATCH 2)
				   (HEAD 2)
				   (ANY 2)
				   (context 2))
 				 (rainbow-delimiters-mode t)
                                 (paredit-mode t)
                                 (subword-mode t))))

(use-package cider
  :ensure t
  :commands (cider cider-connect cider-jack-in)
  :config
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook (lambda ()
				    (setq cider-repl-history-file "~/.emacs.d/cider-history")
                                    (turn-on-eldoc-mode)
                                    (paredit-mode t)
                                    (subword-mode t))))



;;----------------------------------------------------------------------------
;; UI
;;----------------------------------------------------------------------------

(when (display-graphic-p)
  (menu-bar-mode -1)
  (column-number-mode t)
  (size-indication-mode t)
  (setq use-dialog-box nil)
  (setq use-file-dialog nil)
  (setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
  (setq inhibit-startup-screen t)
  (setq inhibit-splash-screen t))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(when (display-graphic-p)
   (set-face-attribute 'default nil :font (if (eq system-type 'darwin) "Andale Mono 12" "Meslo LGS 9"))
   (set-fontset-font "fontset-default" 'korean-ksc5601 (if (eq system-type 'darwin) "NanumGothic-11" "NanumGothic-10")))


(use-package ace-window
  :ensure t
  :bind (("M-p" . ace-window)
         ("C-x o" . ace-window)))

