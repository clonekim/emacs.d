;;-----------------
;; Bootstrap
;;------------------

(set-face-attribute
 'default nil
 :font
 (if (eq system-type 'darwin)
     "Andale Mono 12"
     "DejaVu Sans Mono 9"))

(unless (eq system-type 'darwin)
  (set-fontset-font "fontset-default" 'korean-ksc5601 "NanumGothic-*"))


(setq initial-frame-alist '((width . 140) (height . 57)))
(setq warning-minimum-level :emergency)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq create-lockfiles nil)
(setq custom-file (make-temp-file "emacs-custom"))
(setq default-directory (concat (getenv "HOME") "/"))
(setq linum-format "%6d ")
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 1)
(delete-selection-mode t)
(global-hl-line-mode 1)
(global-linum-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(fringe-mode 1)
(custom-set-faces
 '(fringe-mode 1 nil (fringe))
 (unless (eq system-type 'darwin)
   '(linum ((t (:height 80))))
   )
 )


(global-set-key (kbd "s-t") '(lambda () (interactive)))
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "S-SPC") 'ignore)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(setq-default make-backup-files nil)
(setq-default truncate-lines t)
(setq-default cursor-type 'box)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil) ;;Tab사용안함
(add-hook 'before-save-hook 'delete-trailing-whitespace)



(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package auto-indent-mode
  :config (auto-indent-global-mode ))

(use-package whole-line-or-region)

(use-package whitespace )

(use-package whitespace-cleanup-mode
  :diminish whitespace-cleanup-mode
  :init (global-whitespace-cleanup-mode))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode)
  (add-hook 'prog-mode-hook 'electric-pair-mode))

(use-package which-key
  :config
  (which-key-mode))

(use-package windmove
  :disabled
  :bind
  (("<f2> <right>" . windmove-right)
   ("<f2> <left>" . windmove-left)
   ("<f2> <up>" . windmove-up)
   ("<f2> <down>" . windmove-down)))

(use-package buffer-move
  :config
  (global-set-key (kbd "<C-w-up>")     'buf-move-up)
  (global-set-key (kbd "<C-w-down>")   'buf-move-down)
  (global-set-key (kbd "<C-w-left>")   'buf-move-left)
  (global-set-key (kbd "<C-w-right>")  'buf-move-right))


(use-package undo-tree
  :defer 5
  :config
  (global-undo-tree-mode 1))

(use-package emojify)


(use-package smartparens
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))


(use-package winum
  :init (setq winum-mode-line-position 1
              winum-auto-setup-mode-line nil ; because we want spaceline to do it
              winum-numbering-scope 'global)
  :config (winum-mode))


(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )


(defun find-config ()
  "Edit init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c I") 'find-config)
