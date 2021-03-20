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
  (setq inhibit-splash-screen t)
  (setq initial-frame-alist '((width . 120) (height . 60))))

(when (display-graphic-p)
   (set-face-attribute 'default nil :font (if (eq system-type 'darwin) "Andale Mono 12" "DejaVu Sans Mono 9"))
   (unless (eq system-type 'darwin)
     (set-fontset-font "fontset-default" 'korean-ksc5601 "NanumGothic-9"))
   )


(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))


;;-----------------------------------------------------------------------------
;; Theme
;;-----------------------------------------------------------------------------
;;(load-theme 'gruvbox-dark-hard t)

(setq linum-format "%4d ")
(fringe-mode 1)
(custom-set-faces
 '(fringe ((t (:foreground "blue"))))
 '(fringe-mode 1 nil (fringe))
 (unless (eq system-type 'darwin)
   '(linum ((t (:foreground "green" :height 80))))
   )
 )
