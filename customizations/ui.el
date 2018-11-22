;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

(menu-bar-mode -1)
(global-linum-mode -1)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq initial-frame-alist '((width . 140) (height . 45)))
(add-to-list 'default-frame-alist '(height . 30))
(add-to-list 'default-frame-alist '(width . 100))

;; These settings relate to how emacs interacts with your operating system
(setq  x-select-enable-clipboard t
       x-select-enable-primary t
       save-interprogram-paste-before-kill t
       apropos-do-all t
       mouse-yank-at-point t)


(blink-cursor-mode -1)

(setq-default cursor-type 'box)
(set-cursor-color "yellow")


(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; ignore key binding Super-Space
(global-set-key (kbd "S-SPC") 'ignore)


(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)

;; Font
(set-face-attribute 'default nil :font (if (eq system-type 'darwin) "Andale Mono 12" "DejaVu Sans Mono 8"))
(set-fontset-font "fontset-default" 'korean-ksc5601 (if (eq system-type 'darwin) "NanumGothic-11" "NanumGothic-9"))

(custom-set-variables
 '(linum-format "%5d"))

(custom-set-faces
 '(linum ((t (:height 72)))))

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)
