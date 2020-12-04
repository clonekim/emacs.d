;;-----------------------------------------------------------------------------
;; Bootstrap
;;-----------------------------------------------------------------------------

(defun gc-disable ()
  "Disable automatic garbage collection."
  (setq gc-cons-threshold most-positive-fixnum))

(defun gc-enable ()
  "Enable automatic garbage collection."
  (setq gc-cons-threshold 800000))

(defun copy-line (arg)
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))


(add-hook 'minibuffer-setup-hook #'gc-disable)
(add-hook 'minibuffer-exit-hook #'gc-enable)
(gc-enable)


(global-set-key "\C-c\C-k" 'copy-line)
(fset 'yes-or-no-p 'y-or-n-p)

(blink-cursor-mode 1)
(delete-selection-mode t)
(global-hl-line-mode 1)
(global-linum-mode 1)
(global-auto-revert-mode -1)
(global-set-key (kbd "s-t") '(lambda () (interactive)))
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "S-SPC") 'ignore)
(show-paren-mode 1)

;; (set-cursor-color "yellow")
;; (set-face-background 'mode-line "black")
;; (set-face-foreground 'mode-line "yellow")

(setq custom-file (make-temp-file "emacs-custom"))
(setq default-directory (concat (getenv "HOME") "/"))
(setq ring-bell-function 'ignore)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default make-backup-files nil)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)
(setq-default cursor-type 'box)
(setq-default tab-width 2)

(use-package whole-line-or-region  :ensure t)
(use-package rainbow-delimiters  :ensure t)
(use-package whitespace :ensure t)
(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :init (global-whitespace-cleanup-mode))
